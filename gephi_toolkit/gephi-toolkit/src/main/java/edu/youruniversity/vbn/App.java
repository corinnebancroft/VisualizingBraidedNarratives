package edu.youruniversity.vbn;

import org.gephi.project.api.ProjectController;
import org.gephi.project.api.Workspace;

import org.gephi.graph.api.Graph;
import org.gephi.graph.api.GraphController;
import org.gephi.graph.api.GraphModel;

import org.gephi.io.importer.api.Container;
import org.gephi.io.importer.api.ImportController;
import org.gephi.io.processor.plugin.DefaultProcessor;

import org.gephi.statistics.plugin.Degree;
import org.gephi.statistics.plugin.GraphDistance;
import org.gephi.statistics.plugin.Modularity;

import org.openide.util.Lookup;

import java.io.File;
import java.util.Scanner;
public class App {

    enum GraphType {
        EXCHANGES_ONLY,
        STORY_SPACE,
        TEXT_SPACE
    }

    public static void main(String[] args) throws Exception {

        Scanner scanner = new Scanner(System.in);

        // ---- Collect user input --------------------------------------------

        System.out.print("Enter dataset acronym (e.g., s): ");
        String acronym = scanner.nextLine().trim();

        System.out.print("Enter export date (e.g., April16): ");
        String date = scanner.nextLine().trim();

        System.out.println("Select graph type:");
        System.out.println("  1 = ExchangesOnly");
        System.out.println("  2 = StorySpace");
        System.out.println("  3 = TextSpace");
        System.out.print("> ");

        int choice = Integer.parseInt(scanner.nextLine().trim());

        GraphType graphType;
        switch (choice) {
            case 1:
                graphType = GraphType.EXCHANGES_ONLY;
                break;
            case 2:
                graphType = GraphType.STORY_SPACE;
                break;
            case 3:
                graphType = GraphType.TEXT_SPACE;
                break;
            default:
                throw new IllegalArgumentException("Invalid graph type selection.");
        }

        // ---- Resolve paths --------------------------------------------------

        String baseDir =
                "../../export_scripts/data/"
                + acronym + "/"
                + date + "GephiReadyExports/";

        File nodeFile =
                new File(baseDir + acronym + "Characters.csv");

        File edgeFile;

        boolean directed;

        switch (graphType) {
            case EXCHANGES_ONLY:
                edgeFile = new File(
                        baseDir + acronym + "ExchangesOnlyEdges.csv");
                directed = true;
                break;

            case STORY_SPACE:
                edgeFile = new File(
                        baseDir + acronym + "StorySpaceEdges.csv");
                directed = true;
                break;

            case TEXT_SPACE:
                edgeFile = new File(
                        baseDir + acronym + "TextSpaceEdges.csv");
                directed = false;
                break;

            default:
                throw new IllegalStateException("Unexpected graph type.");
        }

        // ---- Validate files -------------------------------------------------

        if (!nodeFile.exists()) {
            throw new IllegalStateException(
                    "Node file not found: " + nodeFile.getPath());
        }

        if (!edgeFile.exists()) {
            throw new IllegalStateException(
                    "Edge file not found: " + edgeFile.getPath());
        }

        System.out.println("\nResolved input files:");
        System.out.println("Nodes: " + nodeFile.getPath());
        System.out.println("Edges: " + edgeFile.getPath());

        // ---- Gephi project setup -------------------------------------------

        ProjectController pc =
                Lookup.getDefault().lookup(ProjectController.class);
        pc.newProject();

        Workspace workspace = pc.getCurrentWorkspace();

        GraphModel graphModel =
                Lookup.getDefault().lookup(GraphController.class)
                        .getGraphModel(workspace);

        ImportController importController =
                Lookup.getDefault().lookup(ImportController.class);

        // ---- Import nodes ---------------------------------------------------

        Container nodeContainer =
                importController.importFile(nodeFile);
        nodeContainer.getLoader().setAllowAutoNode(false);

        importController.process(
                nodeContainer,
                new DefaultProcessor(),
                workspace
        );

       // ---- Import edges ---------------------------------------------------

Container edgeContainer =
        importController.importFile(edgeFile);

importController.process(
        edgeContainer,
        new DefaultProcessor(),
        workspace
);


// ---- Report ---------------------------------------------------------

Graph graph = graphModel.getGraph();

System.out.println("\nImport complete.");
System.out.println("Node count: " + graph.getNodeCount());
System.out.println("Edge count: " + graph.getEdgeCount());

// ---- STEP 2: Supported Network Statistics ---------------------------

// Degree statistics
Degree degreeStats = new Degree();
degreeStats.execute(graphModel);

double avgDegree = degreeStats.getAverageDegree();

// Manually compute weighted degree from edge weights
double totalWeightedDegree = 0.0;

for (org.gephi.graph.api.Node n : graph.getNodes()) {
    double wd = 0.0;
    for (org.gephi.graph.api.Edge e : graph.getEdges(n)) {
        Object w = e.getAttribute("weight");
        if (w instanceof Number) {
            wd += ((Number) w).doubleValue();
        }
    }
    totalWeightedDegree += wd;
}

double avgWeightedDegree =
        graph.getNodeCount() > 0
        ? totalWeightedDegree / graph.getNodeCount()
        : 0.0;

// Diameter (only reliably exposed global distance metric)
GraphDistance distanceStats = new GraphDistance();
distanceStats.setDirected(graphType != GraphType.TEXT_SPACE);
distanceStats.execute(graphModel);

double diameter = distanceStats.getDiameter();

// Density (computed manually)
double density;
int n = graph.getNodeCount();
int m = graph.getEdgeCount();

if (graphType == GraphType.TEXT_SPACE) {
    density = n > 1 ? (2.0 * m) / (n * (n - 1)) : 0.0;
} else {
    density = n > 1 ? (double) m / (n * (n - 1)) : 0.0;
}

// Modularity
Modularity modularityStats = new Modularity();
modularityStats.execute(graphModel);

double modularityValue = modularityStats.getModularity();

// Count communities manually
java.util.Set<Integer> communities = new java.util.HashSet<>();
for (org.gephi.graph.api.Node nNode : graph.getNodes()) {
    Object mc = nNode.getAttribute("modularity_class");
    if (mc instanceof Integer) {
        communities.add((Integer) mc);
    }
}

int numberOfCommunities = communities.size();

// ---- Report statistics ----------------------------------------------

System.out.println("\nNetwork statistics:");
System.out.println("Average degree: " + avgDegree);
System.out.println("Average weighted degree: " + avgWeightedDegree);
System.out.println("Graph density: " + density);
System.out.println("Network diameter: " + diameter);
System.out.println("Modularity: " + modularityValue);
System.out.println("# of communities: " + numberOfCommunities);

    }
}
