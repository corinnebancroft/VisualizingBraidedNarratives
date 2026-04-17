package edu.youruniversity.vbn;

import org.gephi.project.api.ProjectController;
import org.gephi.project.api.Workspace;

import org.gephi.graph.api.Graph;
import org.gephi.graph.api.GraphController;
import org.gephi.graph.api.GraphModel;
import org.gephi.graph.api.DirectedGraph;
import org.gephi.graph.api.UndirectedGraph;
import org.gephi.graph.api.Edge;
import org.gephi.graph.api.Column;
import org.gephi.graph.api.Node;



import org.gephi.io.importer.api.Container;
import org.gephi.io.importer.api.ImportController;
import org.gephi.io.processor.plugin.DefaultProcessor;

import org.gephi.statistics.plugin.Degree;
import org.gephi.statistics.plugin.GraphDistance;
import org.gephi.statistics.plugin.Modularity;

import org.gephi.layout.plugin.fruchterman.FruchtermanReingold;
import org.gephi.layout.plugin.forceAtlas2.ForceAtlas2;

import org.gephi.preview.api.PreviewController;
import org.gephi.preview.api.PreviewModel;
import org.gephi.preview.api.PreviewProperty;
import org.gephi.io.exporter.api.ExportController;
import org.gephi.io.exporter.preview.SVGExporter;
import org.gephi.io.exporter.api.FileExporter;



import org.openide.util.Lookup;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;
import java.awt.Color;
import java.awt.Font;


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

Graph graph = graphModel.getGraphVisible();


    System.out.println("\nImport complete.");
    System.out.println("Node count: " + graph.getNodeCount());
    System.out.println("Edge count: " + graph.getEdgeCount());

    // ---- STEP 2: Supported Network Statistics ---------------------------

    // Degree statistics
    Degree degreeStats = new Degree();
    degreeStats.execute(graphModel);

    double avgDegree = degreeStats.getAverageDegree();

    // ---- Average Weighted Degree (manual, Gephi-consistent) ----

    double totalWeightedDegree = 0.0;
    int nodeCount = graph.getNodeCount();

    if (graphType == GraphType.TEXT_SPACE) {
        // Undirected
        UndirectedGraph ug = graphModel.getUndirectedGraphVisible();

        for (org.gephi.graph.api.Node node : ug.getNodes()) {
            double wd = 0.0;
            for (Edge e : ug.getEdges(node)) {
            wd += e.getWeight();
            }
            totalWeightedDegree += wd;
        }

    } else {
        // Directed
        DirectedGraph dg = graphModel.getDirectedGraphVisible();

        for (org.gephi.graph.api.Node node : dg.getNodes()) {
            double wd = 0.0;
            for (Edge e : dg.getInEdges(node)) {
                wd += e.getWeight();
            }
            for (Edge e : dg.getOutEdges(node)) {
                wd += e.getWeight();
            }
            totalWeightedDegree += wd;
        }
    }

// ---- Store node strength as a node attribute --------------------------

Column strengthColumn =
        graphModel.getNodeTable().getColumn("node_strength");

if (strengthColumn == null) {
    strengthColumn = graphModel.getNodeTable().addColumn(
            "node_strength",
            Double.class
    );
}

// Compute per-node strength and store it
if (graphType == GraphType.TEXT_SPACE) {
    UndirectedGraph ug = graphModel.getUndirectedGraphVisible();
    for (Node node : ug.getNodes()) {
        double strength = 0.0;
        for (Edge e : ug.getEdges(node)) {
            strength += e.getWeight();
        }
        node.setAttribute(strengthColumn, strength);
    }
} else {
    DirectedGraph dg = graphModel.getDirectedGraphVisible();
    for (Node node : dg.getNodes()) {
        double strength = 0.0;
        for (Edge e : dg.getInEdges(node)) {
            strength += e.getWeight();
        }
        for (Edge e : dg.getOutEdges(node)) {
            strength += e.getWeight();
        }
        node.setAttribute(strengthColumn, strength);
    }
}

// ---- Size nodes by node strength -------------------------------------

double minStrength = Double.MAX_VALUE;
double maxStrength = Double.MIN_VALUE;

// Find min and max strength
for (Node node : graph.getNodes()) {
    Double s = (Double) node.getAttribute(strengthColumn);
    if (s != null) {
        minStrength = Math.min(minStrength, s);
        maxStrength = Math.max(maxStrength, s);
    }
}

// Avoid divide-by-zero if graph is uniform
double range = maxStrength - minStrength;
if (range == 0) {
    range = 1.0;
}

float minSize = 10f;
float maxSize = 100f;

// Linear interpolation: strength → size
for (Node node : graph.getNodes()) {
    Double s = (Double) node.getAttribute(strengthColumn);
    if (s != null) {
        float size =
                (float) (
                    minSize +
                    (s - minStrength) / range * (maxSize - minSize)
                );
        node.setSize(size);
    }
}

    // ---- Node Strength & Average Weighted Degree ----

    // Mean Node Strength: average of total incident edge weight per node
        double meanNodeStrength =
            nodeCount > 0 ? totalWeightedDegree / nodeCount : 0.0;

    // Average Weighted Degree (Gephi definition):
    // for directed graphs, this is half of mean node strength;
    // for undirected graphs, they coincide
        double averageWeightedDegree =
            graphType == GraphType.TEXT_SPACE
            ? meanNodeStrength
            : meanNodeStrength / 2.0;


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

// ---- Color nodes by modularity (methodology-specific) -----------------

// Define gray color once
Color lightGray = Color.decode("#D3D3D3");

// Case 1: Low modularity → all nodes gray
if (modularityValue < 0.3) {
    for (Node node : graph.getNodes()) {
        node.setColor(lightGray);
    }
} else {

    // Count nodes per modularity class
    Map<Integer, Integer> classSizes = new HashMap<>();

    for (Node node : graph.getNodes()) {
        Integer mc = (Integer) node.getAttribute("modularity_class");
        if (mc != null) {
            classSizes.put(mc, classSizes.getOrDefault(mc, 0) + 1);
        }
    }

    // Sort modularity classes by size (descending)
    List<Integer> sortedClasses = new ArrayList<>(classSizes.keySet());
    sortedClasses.sort(
        (a, b) -> classSizes.get(b) - classSizes.get(a)
    );

    // Color palette by rank
    Color[] palette = new Color[] {
        Color.decode("#FF0000"), // red
        Color.decode("#0000FF"), // blue
        Color.decode("#FFFF00"), // yellow
        Color.decode("#FF00FF"), // magenta
        Color.decode("#00FF00"), // green
        Color.decode("#00FFFF"), // cyan
        Color.decode("#FFA500"), // orange
        Color.decode("#8D01FF"), // violet
        Color.decode("#C9FF00")  // chartreuse
    };

    // Map modularity class → color
    Map<Integer, Color> classColors = new HashMap<>();

    for (int i = 0; i < sortedClasses.size(); i++) {
        int mc = sortedClasses.get(i);
        if (i < palette.length) {
            classColors.put(mc, palette[i]);
        } else {
            classColors.put(mc, lightGray);
        }
    }

    // Apply colors to nodes
    for (Node node : graph.getNodes()) {
        Integer mc = (Integer) node.getAttribute("modularity_class");
        if (mc != null && classColors.containsKey(mc)) {
            node.setColor(classColors.get(mc));
        } else {
            node.setColor(lightGray);
        }
    }
}

    // ---- Report statistics ----------------------------------------------

    System.out.println("\nNetwork statistics:");
    System.out.println("Average degree: " + avgDegree);
    System.out.println("Mean node strength: " + meanNodeStrength);
    System.out.println("Average weighted degree (Gephi definition): " + averageWeightedDegree);
    System.out.println("Graph density: " + density);
    System.out.println("Network diameter: " + diameter);
    System.out.println("Modularity: " + modularityValue);
    System.out.println("# of communities: " + numberOfCommunities);


// ---- Layout Step 1: Fruchterman–Reingold -------------------------------

FruchtermanReingold frLayout = new FruchtermanReingold(null);
frLayout.setGraphModel(graphModel);

// Area = 10 × number of nodes (as per methodology)
int frArea = graph.getNodeCount() * 10;
frLayout.setArea((float) frArea);

// Optional but sensible tuning
frLayout.setGravity(10.0);   // mild centering force
frLayout.setSpeed(1.0);

// Initialize and run for a fixed number of iterations
frLayout.initAlgo();
for (int i = 0; i < 500; i++) {
    frLayout.goAlgo();
}
frLayout.endAlgo();

// ---- Layout Step 2: ForceAtlas 2 --------------------------------------

ForceAtlas2 fa2Layout = new ForceAtlas2(null);
fa2Layout.setGraphModel(graphModel);

// Parameters derived from methodology
int nodeCountForLayout = graph.getNodeCount();

fa2Layout.setScalingRatio(Double.valueOf(nodeCountForLayout));
fa2Layout.setGravity(Double.valueOf(nodeCountForLayout / 2.0));
fa2Layout.setAdjustSizes(true);          // prevent overlap
fa2Layout.setEdgeWeightInfluence(1.0);   // already a Double literal

// Initialize and run for a fixed number of iterations
fa2Layout.initAlgo();
for (int i = 0; i < 800; i++) {
    fa2Layout.goAlgo();
}
fa2Layout.endAlgo();

    // ---- Export statistics to CSV ----------------------------------------

    String statsFile = "network_statistics.csv";

    boolean fileExists = new File(statsFile).exists();

    try (FileWriter writer = new FileWriter(statsFile, true)) {

        // Write header if file does not exist yet
        if (!fileExists) {
            writer.write(
                "Dataset,Date,GraphType," +
                "NumNodes,NumEdges," +
                "MeanNodeStrength,AverageWeightedDegree," +
                "NetworkDiameter,GraphDensity," +
                "Modularity,NumCommunities\n"
            );
        }

        writer.write(
            acronym + "," +
            date + "," +
            graphType.name() + "," +
            graph.getNodeCount() + "," +
            graph.getEdgeCount() + "," +
            meanNodeStrength + "," +
            averageWeightedDegree + "," +
            diameter + "," +
            density + "," +
            modularityValue + "," +
            numberOfCommunities + "\n"
        );

    } catch (IOException e) {
        System.err.println("Failed to write statistics file: " + e.getMessage());
    }

    // ---- Preview configuration (match Gephi Preview tab) ------------------

PreviewController previewController =
        Lookup.getDefault().lookup(PreviewController.class);
PreviewModel previewModel = previewController.getModel();

// Node labels
previewModel.getProperties().putValue(
        PreviewProperty.SHOW_NODE_LABELS, true);
previewModel.getProperties().putValue(
        PreviewProperty.NODE_LABEL_FONT,
        new Font("Source Sans 3", Font.PLAIN, 12)
);
previewModel.getProperties().putValue(
        PreviewProperty.NODE_LABEL_PROPORTIONAL_SIZE, true);

// Edges
previewModel.getProperties().putValue(
        PreviewProperty.EDGE_CURVED, false);

// Make sure preview is refreshed
previewController.refreshPreview();

// ---- Export SVG -------------------------------------------------------

ExportController exportController =
        Lookup.getDefault().lookup(ExportController.class);

String svgFileName =
        acronym + "_" +
        graphType.name() + "_" +
        date + ".svg";

SVGExporter svgExporter =
        (SVGExporter) exportController.getExporter("svg");

svgExporter.setWorkspace(workspace);

exportController.exportFile(
        new File(svgFileName),
        svgExporter
);

System.out.println("SVG exported: " + svgFileName);

// ---- Export graph to GEXF for Gephi GUI -------------------------------

ExportController exportController =
        Lookup.getDefault().lookup(ExportController.class);

String gexfFileName =
        acronym + "_" +
        graphType.name() + "_" +
        date + ".gexf";

// ---- Export graph to GEXF for Gephi GUI (Toolkit 0.10.x) ---------------

ExportController exportController =
        Lookup.getDefault().lookup(ExportController.class);

String gexfFileName =
        acronym + "_" +
        graphType.name() + "_" +
        date + ".gexf";

// Get exporter as FileExporter (correct for 0.10.x)
FileExporter gexfExporter =
        (FileExporter) exportController.getExporter("gexf");

// Configure exporter properties
gexfExporter.getProperties().putValue("exportPosition", true);
gexfExporter.getProperties().putValue("exportNodeSize", true);
gexfExporter.getProperties().putValue("exportColors", true);

// Write file
exportController.exportFile(
        new File(gexfFileName),
        gexfExporter
);

System.out.println("GEXF exported for Gephi: " + gexfFileName);



System.exit(0);
    }
}
