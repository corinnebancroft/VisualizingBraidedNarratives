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
import org.gephi.io.exporter.spi.Exporter;



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
import java.io.PrintWriter;

import java.util.Scanner;
public class App {

    enum GraphType {
        ex,     // exchanges
        exnf,   // exchanges, no floaters
        ss,     // story space
        ts      // text space
    }

    private static String csv(String value) {
    if (value == null) return "";
    // Escape double quotes by doubling them
    String escaped = value.replace("\"", "\"\"");
    return "\"" + escaped + "\"";
    }

    private static List<String> loadNCNsForDataset(String acronym) {
    List<String> ncnIds = new ArrayList<>();

    File file = new File("ncn.csv");

    if (!file.exists()) {
        System.out.println("No ncn.csv found — assuming no NCNs.");
        return ncnIds;
    }

    try (Scanner scanner = new Scanner(file)) {

        // Skip header
        if (scanner.hasNextLine()) scanner.nextLine();

        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();

            String[] parts =
                line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)", -1);

            if (parts.length < 2) continue;

            String dataset = parts[0].trim();
            String nodeId  = parts[1].trim();

            if (dataset.equalsIgnoreCase(acronym)) {
                ncnIds.add(nodeId);
            }
        }

    } catch (Exception e) {
        System.err.println("Failed to read ncn.csv: " + e.getMessage());
    }

    return ncnIds;
}

    private static void appendGephiDiagnostics(
    String dataset,
    String date,
    String graphType,
    int nodeCount,
    double avgNearestNeighbor,
    int hardCollisions,
    int softCollisions,
    double meanSpacingRatio,
    double boundingBoxArea,
    double nodesPerUnitArea
) {
    String csvFile = "LabelMeasurements.csv";
    File file = new File(csvFile);

    boolean writeHeader = true;

    // Check whether the file already has a header
    if (file.exists() && file.length() > 0) {
        try (Scanner scanner = new Scanner(file)) {
            if (scanner.hasNextLine()) {
                String firstLine = scanner.nextLine();
                if (firstLine.startsWith("Dataset,Date,GraphType")) {
                    writeHeader = false;
                }
            }
        } catch (IOException e) {
            // If we fail to read, err on the side of writing the header
        }
    }

    try (PrintWriter out = new PrintWriter(new FileWriter(csvFile, true))) {

        if (writeHeader) {
            out.println(
                "Dataset,Date,GraphType," +
                "LabelRadius90,LabelRadiusMedian,LabelRadiusMax,LabelCount," +
                "GNodeCount,GAvgNearestNeighbor,GHardCollisions," +
                "GSoftCollisions,GMeanSpacingRatio," +
                "GBoundingBoxArea,GNodesPerUnitArea"
            );
        }

        out.printf(
            "%s,%s,%s,,,,%d,%.6f,%d,%d,%.6f,%.6f,%.6f%n",
            dataset,
            date,
            graphType,
            nodeCount,
            avgNearestNeighbor,
            hardCollisions,
            softCollisions,
            meanSpacingRatio,
            boundingBoxArea,
            nodesPerUnitArea
        );

    } catch (IOException e) {
        System.err.println(
            "Failed to append Gephi diagnostics: " + e.getMessage()
        );
    }
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
                graphType = GraphType.ex;
                break;
            case 2:
                graphType = GraphType.ss;
                break;
            case 3:
                graphType = GraphType.ts;
                break;
            default:
                throw new IllegalArgumentException("Invalid graph type selection.");
        }

        GraphType outputGraphType = graphType;
        int floatersRemovedThisRun = 0;

        System.out.println("\nHow do you want to color communities?");
        System.out.println("  1 = By community size (ranked)");
        System.out.println("  2 = By community leader (from CSV)");
        System.out.print("> ");

        int colorChoice = Integer.parseInt(scanner.nextLine().trim());

        List<String> ncnIds = loadNCNsForDataset(acronym);

        boolean hasNCN = !ncnIds.isEmpty();

        System.out.println("\nNCN nodes detected: " + ncnIds.size());


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
            case ex:
                edgeFile = new File(
                        baseDir + acronym + "ExchangesOnlyEdges.csv");
                directed = true;
                break;

            case ss:
                edgeFile = new File(
                        baseDir + acronym + "StorySpaceEdges.csv");
                directed = true;
                break;

            case ts:
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

    // ---- Determine how many runs to execute -----------------------------

int runs = (graphType == GraphType.ex) ? 2 : 1;  // keep existing behavior

if (hasNCN) {
    runs *= 2;  // double runs if NCNs exist
}

// ---- RUN LOOP -------------------------------------------------------

for (int run = 0; run < runs; run++) {

    floatersRemovedThisRun = 0;

    // --- Determine run type ------------------------------------------

    boolean isNCNRun = false;
    boolean isFloaterRemovalRun = false;

    if (!hasNCN) {

        // ORIGINAL behavior
        if (graphType == GraphType.ex) {
            isFloaterRemovalRun = (run == 1);
        }

    } else {

        if (graphType == GraphType.ex) {
            // 4 runs:
            // 0 = exncn
            // 1 = ex
            // 2 = exncn + exnf
            // 3 = ex + exnf

            isNCNRun = (run == 0 || run == 2);
            isFloaterRemovalRun = (run >= 2);

        } else {
            // ss / ts → 2 runs

            isNCNRun = (run == 0); // first run keeps NCNs
        }
    }

    // --- Build graph type label (THIS REPLACES outputGraphType logic) --

    String graphTypeLabel = graphType.name();

    if (isFloaterRemovalRun && graphType == GraphType.ex) {
        graphTypeLabel = "exnf";
    }

    if (isNCNRun && hasNCN) {
        graphTypeLabel += "ncn";
    }

    // --- REMOVE NCNs if this is NOT the NCN run -----------------------

    if (hasNCN && !isNCNRun) {

        System.out.println("Removing NCN nodes...");

        DirectedGraph dg = graphModel.getDirectedGraphVisible();
        List<Node> toRemove = new ArrayList<>();

        for (Node node : dg.getNodes()) {
            String nodeId = node.getId().toString();

            if (ncnIds.contains(nodeId)) {
                toRemove.add(node);
            }
        }

        for (Node n : toRemove) {
            dg.removeNode(n);
        }

        System.out.println("Removed " + toRemove.size() + " NCN nodes.");
    }

    floatersRemovedThisRun = 0;

    if (run == 0) {
        outputGraphType = graphType;
    }

    // Second run: remove floaters (EX only)
    if (isFloaterRemovalRun) {

        System.out.println("Removing floaters (isolated nodes) for exnf graph...");

        DirectedGraph dg = graphModel.getDirectedGraphVisible();
        List<Node> floaters = new ArrayList<>();

        for (Node node : dg.getNodes()) {
            if (dg.getInDegree(node) == 0 && dg.getOutDegree(node) == 0) {
                floaters.add(node);
            }
        }

        for (Node floater : floaters) {
    dg.removeNode(floater);
}

floatersRemovedThisRun = floaters.size();

System.out.println(
    "Removed " + floatersRemovedThisRun + " floaters. Remaining nodes: " +
    dg.getNodeCount()
);

    }

    // ---- STEP 2: Supported Network Statistics ---------------------------

    // Degree statistics
    Degree degreeStats = new Degree();
    degreeStats.execute(graphModel);

    double avgDegree = degreeStats.getAverageDegree();

    // ---- Average Weighted Degree (manual, Gephi-consistent) ----

    double totalWeightedDegree = 0.0;
    int nodeCount = graph.getNodeCount();

    if (graphType == GraphType.ts) {
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
if (graphType == GraphType.ts) {
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
            graphType == GraphType.ts
            ? meanNodeStrength
            : meanNodeStrength / 2.0;


    // Diameter (only reliably exposed global distance metric)
    GraphDistance distanceStats = new GraphDistance();
    distanceStats.setDirected(graphType != GraphType.ts);
    distanceStats.execute(graphModel);

    double diameter = distanceStats.getDiameter();


    // Density (computed manually)
    double density;
    int n = graph.getNodeCount();
    int m = graph.getEdgeCount();

    if (graphType == GraphType.ts) {
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

    final Column strengthColumnFinal = strengthColumn;

// ---- Color nodes by modularity  -----------------

// Define gray color once
Color lightGray = Color.decode("#D3D3D3");

// Define color pallet
 Color[] palette = new Color[] {
        Color.decode("#FF0000"), // red
        Color.decode("#2891ff"), // blue
        Color.decode("#FFFF00"), // yellow
        Color.decode("#FF00FF"), // magenta
        Color.decode("#00FF00"), // green
        Color.decode("#00FFFF"), // cyan
        Color.decode("#FFA500"), // orange
        Color.decode("#8D01FF"), // purple
        Color.decode("#C9FF00"),  // chartreuse
        Color.decode("#bdb4f9"), // violet
        Color.decode("#e5b4af")  // salmon
    };

    // Map modularity class → color
    Map<Integer, Color> classColors = new HashMap<>();

// Case 1: Low modularity → all nodes blue
Color sameBlue = Color.decode("#2891ff");
if (modularityValue < 0.3) {

    for (Node node : graph.getNodes()) {
        node.setColor(sameBlue);
    }

} else if (colorChoice == 1) {
    classColors.clear();

    // ---- Color communities by SIZE (existing logic) -------------------

    // Count nodes per modularity class
    Map<Integer, Integer> classSizes = new HashMap<>();

    for (Node node : graph.getNodes()) {
        Integer mc = (Integer) node.getAttribute("modularity_class");
        if (mc != null) {
            classSizes.put(mc, classSizes.getOrDefault(mc, 0) + 1);
        }
    }

    // Sort modularity classes by size (descending)
    List<Integer> sortedClasses =
            new ArrayList<>(classSizes.keySet());

    sortedClasses.sort(
        (a, b) -> classSizes.get(b) - classSizes.get(a)
    );

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
} else if (colorChoice == 2) {

    // ---- Leader-based coloring (ROBUST: leader_id matching) ------------

    Map<String, Color> colorByName = new HashMap<>();
    colorByName.put("red",        Color.decode("#FF0000"));
    colorByName.put("blue",       Color.decode("#2891ff"));
    colorByName.put("yellow",     Color.decode("#FFFF00"));
    colorByName.put("magenta",    Color.decode("#FF00FF"));
    colorByName.put("green",      Color.decode("#00FF00"));
    colorByName.put("cyan",       Color.decode("#00FFFF"));
    colorByName.put("orange",     Color.decode("#FFA500"));
    colorByName.put("purple",     Color.decode("#8D01FF"));
    colorByName.put("chartreuse", Color.decode("#C9FF00"));
    colorByName.put("violet",     Color.decode("#bdb4f9"));
    colorByName.put("salmon",     Color.decode("#e5b4af"));

    String leadersFileName =
        acronym + "_community_leaders_" + graphTypeLabel + ".csv";

    File leadersFile = new File(leadersFileName);

    if (!leadersFile.exists()) {
        System.err.println(
            "Leader coloring selected, but CSV not found: " +
            leadersFileName
        );
    } else {

        // ---- STEP 1: Read CSV → leader_id → Color ----------------------

        Map<String, Color> leaderColorMap = new HashMap<>();

        try (Scanner fileScanner = new Scanner(leadersFile)) {

            if (fileScanner.hasNextLine()) {
                fileScanner.nextLine(); // skip header
            }

            while (fileScanner.hasNextLine()) {
                String line = fileScanner.nextLine();

                String[] parts =
                    line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)", -1);

                if (parts.length <= 7) continue;

                String colorName = parts[1].trim().toLowerCase();
                if (colorName.isEmpty()) continue;

                String leaderId = parts[4].trim(); // ✅ leader_id

                if (colorByName.containsKey(colorName)) {
                    leaderColorMap.put(leaderId, colorByName.get(colorName));
                }
            }

        } catch (Exception e) {
            System.err.println(
                "Failed to read leader color CSV: " + e.getMessage()
            );
        }

        System.out.println("Leader colors loaded: " + leaderColorMap.size());

        // ---- STEP 2: Detect runtime communities & leaders --------------

        Map<Integer, List<Node>> nodesByCommunity = new HashMap<>();

        for (Node node : graph.getNodes()) {
            Integer mc = (Integer) node.getAttribute("modularity_class");
            if (mc == null) continue;

            nodesByCommunity
                .computeIfAbsent(mc, k -> new ArrayList<>())
                .add(node);
        }

        Map<Integer, Color> communityColors = new HashMap<>();

        for (Map.Entry<Integer, List<Node>> entry : nodesByCommunity.entrySet()) {

            Integer mc = entry.getKey();
            List<Node> communityNodes = entry.getValue();

            communityNodes.sort((a, b) -> {
                Double sa = (Double) a.getAttribute(strengthColumnFinal);
                Double sb = (Double) b.getAttribute(strengthColumnFinal);
                if (sa == null) sa = 0.0;
                if (sb == null) sb = 0.0;
                return Double.compare(sb, sa);
            });

            Node leader = communityNodes.get(0);
            String leaderId = leader.getId().toString();

            if (leaderColorMap.containsKey(leaderId)) {
                communityColors.put(mc, leaderColorMap.get(leaderId));
            }
        }

        System.out.println("Communities colored: " + communityColors.size());

        // ---- STEP 3: Apply colors -------------------------------------

        for (Node node : graph.getNodes()) {
            Integer mc = (Integer) node.getAttribute("modularity_class");

            if (mc != null && communityColors.containsKey(mc)) {
                node.setColor(communityColors.get(mc));
            } else {
                node.setColor(lightGray);
            }
        }
    }



} else {

    throw new IllegalArgumentException(
        "Invalid color choice. Use 1 or 2."
    );
}

// ---- Export community leaders for manual color annotation ------------

if (modularityValue >= 0.3) {

    String leadersFileName =
            acronym + "_community_leaders_" + graphTypeLabel + ".csv";

    File leadersFile = new File(leadersFileName);

    if (leadersFile.exists()) {
        System.out.println(
            "Community leaders CSV already exists — not overwriting: "
            + leadersFileName
        );
    } else {

        Map<Integer, List<Node>> nodesByCommunity = new HashMap<>();

        for (Node node : graph.getNodes()) {
            Integer mc = (Integer) node.getAttribute("modularity_class");
            if (mc == null) continue;

            nodesByCommunity
                .computeIfAbsent(mc, k -> new ArrayList<>())
                .add(node);
        }

        try (FileWriter writer = new FileWriter(leadersFileName)) {

            writer.write(
                "leader_label," +
                "assigned_color," +
                "community_size," +
                "other_large_nodes," +
                "leader_id," +
                "leader_strength," +
                "leader_size," +
                "modularity_class," +
                "notes\n"
            );

            List<Integer> sortedCommunityIds =
                    new ArrayList<>(nodesByCommunity.keySet());

            sortedCommunityIds.sort((a, b) ->
                nodesByCommunity.get(b).size()
                - nodesByCommunity.get(a).size()
            );

            for (Integer mc : sortedCommunityIds) {

                List<Node> communityNodes = nodesByCommunity.get(mc);

                communityNodes.sort((a, b) -> {
                    Double sa = (Double) a.getAttribute(strengthColumnFinal);
                    Double sb = (Double) b.getAttribute(strengthColumnFinal);
                    if (sa == null) sa = 0.0;
                    if (sb == null) sb = 0.0;
                    return Double.compare(sb, sa);
                });

                Node leader = communityNodes.get(0);

                Double leaderStrength =
                        (Double) leader.getAttribute(strengthColumnFinal);
                if (leaderStrength == null) leaderStrength = 0.0;

                float leaderSize = leader.size();

                List<Node> others = new ArrayList<>(communityNodes);
                others.remove(leader);

                others.sort((a, b) ->
                    Float.compare(b.size(), a.size())
                );

                StringBuilder otherLargeNodes = new StringBuilder();
                int limit = Math.min(5, others.size());

                for (int i = 0; i < limit; i++) {
                    Node otherNode = others.get(i);
                    if (i > 0) otherLargeNodes.append("; ");
                    otherLargeNodes.append(
                        otherNode.getLabel().replace(",", "") +
                        " (" + String.format("%.1f", otherNode.size()) + ")"
                    );
                }

               writer.write(
    csv(leader.getLabel()) + "," +      // leader_label
    "," +                               // assigned_color (left blank for manual entry)
    communityNodes.size() + "," +       // community_size
    csv(otherLargeNodes.toString()) + "," + // other_large_nodes
    leader.getId() + "," +              // leader_id
    String.format("%.4f", leaderStrength) + "," + // leader_strength
    String.format("%.2f", leaderSize) + "," +     // leader_size
    mc + "," +                          // modularity_class
    "" +                                // notes (blank)
    "\n"
);


            }

            System.out.println(
                "Community leaders CSV exported: " + leadersFileName
            );

        } catch (IOException e) {
            System.err.println(
                "Failed to export community leaders CSV: " + e.getMessage()
            );
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

// ----- Component-aware rescaling  ----------------------------

Map<Node, Integer> componentOf = null;
int giantIndex = -1;

if (outputGraphType != GraphType.ex) {

graph.readLock();
try {

    componentOf = new HashMap<>();
    List<List<Node>> components = new ArrayList<>();

    int componentId = 0;

    for (Node startNode : graph.getNodes()) {
        if (componentOf.containsKey(startNode)) continue;

        List<Node> component = new ArrayList<>();
        ArrayList<Node> bfsQueue = new ArrayList<>();
        bfsQueue.add(startNode);
        componentOf.put(startNode, componentId);

        while (!bfsQueue.isEmpty()) {
            Node currentNode = bfsQueue.remove(0);
            component.add(currentNode);

            for (Node neighborNode : graph.getNeighbors(currentNode)) {
                if (!componentOf.containsKey(neighborNode)) {
                    componentOf.put(neighborNode, componentId);
                    bfsQueue.add(neighborNode);
                }
            }
        }

        components.add(component);
        componentId++;
    }

    // Find the giant component
    giantIndex = 0;
    int giantComponentSize = 0;

    for (int i = 0; i < components.size(); i++) {
        if (components.get(i).size() > giantComponentSize) {
            giantComponentSize = components.get(i).size();
            giantIndex = i;
        }
    }

    // Compute centroid of giant component
    float giantCx = 0f;
    float giantCy = 0f;

    for (Node giantNode : components.get(giantIndex)) {
        giantCx += giantNode.x();
        giantCy += giantNode.y();
    }
    giantCx /= components.get(giantIndex).size();
    giantCy /= components.get(giantIndex).size();

    // Pull satellites closer
    float compressionFactor = 0.4f;

    for (int cIdx = 0; cIdx < components.size(); cIdx++) {
        if (cIdx == giantIndex) continue;

        List<Node> satelliteComponent = components.get(cIdx);

        float compCx = 0f;
        float compCy = 0f;

        for (Node compNode : satelliteComponent) {
            compCx += compNode.x();
            compCy += compNode.y();
        }
        compCx /= satelliteComponent.size();
        compCy /= satelliteComponent.size();

        float dx = giantCx - compCx;
        float dy = giantCy - compCy;

        for (Node compNode : satelliteComponent) {
            compNode.setX(compNode.x() + dx * compressionFactor);
            compNode.setY(compNode.y() + dy * compressionFactor);
        }
    }

} finally {
    graph.readUnlock();
}
}

// =====================================================================
// SMART EXPANSION (GLOBAL NORMALIZATION + CORE CORRECTION)
// =====================================================================

final double EXPANSION_FACTOR =
        (graphType == GraphType.ex) ? 3.0 : 2.0;

double preScale = 0.6;

graph.readLock();
try {
    // ---- Compute global centroid ------------------------------------
    double globalCx = 0.0;
    double globalCy = 0.0;
    int count = 0;

    for (Node node : graph.getNodes()) {
        globalCx += node.x();
        globalCy += node.y();
        count++;
    }

    if (count > 0) {
        globalCx /= count;
        globalCy /= count;
    }

    boolean hasComponents =
            componentOf != null && giantIndex >= 0;

    for (Node node : graph.getNodes()) {

        double dx = node.x() - globalCx;
        double dy = node.y() - globalCy;

        // ✅ Step 1: global normalization (ALL nodes)
        dx *= preScale;
        dy *= preScale;

        // ✅ Step 2: restore core scale ONLY
        if (hasComponents) {
            Integer comp = componentOf.get(node);
            if (comp != null && comp == giantIndex) {

                // undo prescale ONLY for core
                dx /= preScale;
                dy /= preScale;
            }
        }

        // ✅ Step 3: apply your validated expansion
        dx *= EXPANSION_FACTOR;
        dy *= EXPANSION_FACTOR;

        node.setX((float)(globalCx + dx));
        node.setY((float)(globalCy + dy));
    }

} finally {
    graph.readUnlock();
}

    // ---- Export statistics to CSV ----------------------------------------

    String statsFile = "network_statistics.csv";

    boolean fileExists = new File(statsFile).exists();

    try (FileWriter writer = new FileWriter(statsFile, true)) {

        // Write header if file does not exist yet
        if (!fileExists) {
           writer.write(
                "Dataset,Date,GraphType," +
                "NumNodes,NumEdges," +
                "AverageDegree,MeanNodeStrength,AverageWeightedDegree," +
                "NetworkDiameter,GraphDensity," +
                "Modularity,NumCommunities,NumFloatersRemoved\n"
            );

        }

        writer.write(
            acronym + "," +
            date + "," +
            graphTypeLabel + "," +
            graph.getNodeCount() + "," +
            graph.getEdgeCount() + "," +
            avgDegree + "," +
            meanNodeStrength + "," +
            averageWeightedDegree + "," +
            diameter + "," +
            density + "," +
            modularityValue + "," +
            numberOfCommunities + "," +
            floatersRemovedThisRun + "\n"
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
        new Font("Arial", Font.PLAIN, 12)
);
previewModel.getProperties().putValue(
        PreviewProperty.NODE_LABEL_PROPORTIONAL_SIZE, true);

// Edges
previewModel.getProperties().putValue(
        PreviewProperty.EDGE_CURVED, false);


// Make sure preview is refreshed
previewController.refreshPreview();

// =====================================================================
// STEP 1: Geometric diagnostics of final layout (no layout modification)
// =====================================================================

// Collect nodes into a list for indexed access
List<Node> nodes = new ArrayList<>();
for (Node node : graph.getNodes()) {
    nodes.add(node);
}

int N = nodes.size();

// -------------------------------------------------------------
// 1. Average Nearest-Neighbor Distance (center-to-center)
// -------------------------------------------------------------
double totalNearestDistance = 0.0;

for (int i = 0; i < N; i++) {
    Node a = nodes.get(i);
    double minDist = Double.MAX_VALUE;

    for (int j = 0; j < N; j++) {
        if (i == j) continue;

        Node b = nodes.get(j);
        double dx = a.x() - b.x();
        double dy = a.y() - b.y();
        double d = Math.sqrt(dx * dx + dy * dy);

        if (d < minDist) {
            minDist = d;
        }
    }
    totalNearestDistance += minDist;
}

double avgNearestNeighbor =
        N > 0 ? totalNearestDistance / N : 0.0;


// -------------------------------------------------------------
// 2. Node collision analysis (using node size as radius)
// -------------------------------------------------------------
int hardCollisions = 0;   // actual overlaps
int softCollisions = 0;   // near overlaps

for (int i = 0; i < N; i++) {
    Node a = nodes.get(i);
    float ra = a.size();

    for (int j = i + 1; j < N; j++) {
        Node b = nodes.get(j);
        float rb = b.size();

        double dx = a.x() - b.x();
        double dy = a.y() - b.y();
        double d = Math.sqrt(dx * dx + dy * dy);
        double rSum = ra + rb;

        if (d < rSum) {
            hardCollisions++;
        } else if (d < rSum * 1.2) {
            softCollisions++;
        }
    }
}


// -------------------------------------------------------------
// 3. Mean spacing ratio (nearest distance / node radius)
// -------------------------------------------------------------
double spacingRatioSum = 0.0;

for (int i = 0; i < N; i++) {
    Node a = nodes.get(i);
    double minDist = Double.MAX_VALUE;

    for (int j = 0; j < N; j++) {
        if (i == j) continue;

        Node b = nodes.get(j);
        double dx = a.x() - b.x();
        double dy = a.y() - b.y();
        double d = Math.sqrt(dx * dx + dy * dy);

        if (d < minDist) {
            minDist = d;
        }
    }

    if (a.size() > 0) {
        spacingRatioSum += minDist / a.size();
    }
}

double meanSpacingRatio =
        N > 0 ? spacingRatioSum / N : 0.0;


// -------------------------------------------------------------
// 4. Bounding box & density proxy
// -------------------------------------------------------------
float minX = Float.MAX_VALUE;
float maxX = -Float.MAX_VALUE;
float minY = Float.MAX_VALUE;
float maxY = -Float.MAX_VALUE;

for (Node node : nodes) {
    minX = Math.min(minX, node.x());
    maxX = Math.max(maxX, node.x());
    minY = Math.min(minY, node.y());
    maxY = Math.max(maxY, node.y());
}

double boundingBoxArea =
        (maxX > minX && maxY > minY)
        ? (maxX - minX) * (maxY - minY)
        : 0.0;

double nodesPerArea =
        boundingBoxArea > 0 ? N / boundingBoxArea : 0.0;


// -------------------------------------------------------------
// 5. REPORT
// -------------------------------------------------------------
System.out.println("\n--- Layout Geometry Diagnostics ---");
System.out.println("Number of nodes: " + N);
System.out.printf("Average nearest-neighbor distance: %.3f%n",
        avgNearestNeighbor);
System.out.println("Hard node collisions (overlaps): " + hardCollisions);
System.out.println("Soft node collisions (near overlaps): " + softCollisions);
System.out.printf("Mean spacing ratio (dist / radius): %.3f%n",
        meanSpacingRatio);
System.out.printf("Bounding box area: %.3f%n", boundingBoxArea);
System.out.printf("Nodes per unit area: %.6f%n", nodesPerArea);
System.out.println("-----------------------------------");

appendGephiDiagnostics(
    acronym,
    date,
    graphTypeLabel,
    N,
    avgNearestNeighbor,
    hardCollisions,
    softCollisions,
    meanSpacingRatio,
    boundingBoxArea,
    nodesPerArea
);

// ---- Export SVG -------------------------------------------------------

ExportController exportController =
        Lookup.getDefault().lookup(ExportController.class);

String svgFileName =
        acronym + "_" +
        graphTypeLabel + "_" +
        date + ".svg";

SVGExporter svgExporter =
        (SVGExporter) exportController.getExporter("svg");

svgExporter.setWorkspace(workspace);

exportController.exportFile(
        new File(svgFileName),
        svgExporter
);

System.out.println("SVG exported: " + svgFileName);

// ---- Post-process SVG labels with Python -----------------------------

try {
    ProcessBuilder pb = new ProcessBuilder(
        "python3",
        "SVGLabelTuning.py",
        svgFileName
    );

    // Ensure same working directory as Java process
    pb.directory(new File("."));
    pb.redirectErrorStream(true);

    Process process = pb.start();

    // Capture Python output (important for debugging)
    try (Scanner pyOut = new Scanner(process.getInputStream())) {
        while (pyOut.hasNextLine()) {
            System.out.println("[PY] " + pyOut.nextLine());
        }
    }

    int exitCode = process.waitFor();
    if (exitCode != 0) {
        System.err.println(
            "SVGLabelTuning failed for " + svgFileName +
            " (exit code " + exitCode + ")"
        );
    }

} catch (Exception e) {
    System.err.println(
        "Failed to run SVGLabelTuning.py on " +
        svgFileName + ": " + e.getMessage()
    );
}


// ---- Export GEXF (Gephi Toolkit 0.10.x compatible) --------------------

String gexfFileName =
        acronym + "_" +
        graphTypeLabel + "_" +
        date + ".gexf";


// Correct type for 0.10.x
Exporter gexfExporter =
        exportController.getExporter("gexf");

// Export graph + layout + attributes
exportController.exportFile(
        new File(gexfFileName),
        gexfExporter
);

System.out.println("GEXF exported: " + gexfFileName);

} // end run loop
}
}