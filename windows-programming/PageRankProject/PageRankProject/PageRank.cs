using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using HtmlAgilityPack;
using Microsoft.Msagl.GraphViewerGdi;
using Microsoft.Msagl.Drawing;

namespace PageRankProject
{
    public partial class PageRank : Form
    {

        public PageRank()
        {
            InitializeComponent();
        }

        private bool hasEdge(Graph graph, String src, String sink)
        {
            if (graph.FindNode(src).OutEdges.Count() > 0)
            {
                foreach (Edge e in graph.FindNode(src).OutEdges)
                {
                    if (e.Target.ToString() == sink) return true;
                }
            }
            return false;
        }

        private void addEdges(Graph graph, String src, List<String> edges, int recursionDepth)
        {
            // Add the src as an initial node
            if (chkbox_stripPrefixes.Checked && src.Length > 5) src = src.Substring(src.IndexOf("//") + 2);
            graph.AddNode(src);

            // Our user has specified a "Recursion Depth" in the gui that corresponds to
            // how many links after the src we should visit. This means we should
            // also add the edges and nodes of the initial list of links we have,
            // and continue until the recursion depth is zero.

            // Iterate through all of the edges in our list
            foreach (String edge in edges)
            {
                // Our users have the option of stripping the prefixes (https:// or http://) from the links,
                // but if are going to recur on the edges, then we need to keep the initial prefix hanging around 
                String sedge = (chkbox_stripPrefixes.Checked && edge.Contains("//") && edge.Length > 5) ? edge.Substring(edge.IndexOf("//") + 2) : edge;
                // append the edge to the logs or display links textbox with a new line 
                txt_DisplayLinks.AppendText(sedge + '\n');
                // if the site hasn't already been added
                if (graph.FindNode(sedge) == null)
                {
                    // Add the edge as a node
                    graph.AddNode(sedge);
                }

                // Create an edge from the src to the new edge node, if one does not exist already
                if (chkbox_AllowMultEdges.Checked || !hasEdge(graph, src, sedge))
                {
                    graph.AddEdge(src, "", sedge);
                }

                if (recursionDepth >= 1) { //&& Uri.TryCreate(edge, UriKind.Absolute, out test)) {
                    addEdges(graph, edge, retrieveLinks(edge, chkbox_excludeLocal.Checked), recursionDepth - 1);
                }
            }
        }

        private List<String> retrieveLinks(String url, bool excludeLocal)
        {
            // Create a new HTML Web object to get our HTML document
            HtmlWeb WebGet = new HtmlWeb();

            // We want to remove form tags because this can cause some issues
            HtmlNode.ElementsFlags.Remove("form");

            // Create new HTML Document with the HtmlAgilityPack library
            HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();

            // Fix nested tags with doc options
            doc.OptionFixNestedTags = true;

            // Let's prepare a list of strings to store our links from the HTML document we've loaded
            List<string> result = new List<string>();

            // Load a web page. We need to put this in a try/catch statement in case our user has put in some invalid input
            try
            {
                doc = WebGet.Load(url);
                // We need to iterate through every 'htmlnode' object in our document
                // We create a collection of htmlnodes by using the .SelectNodes method on the documentNode,
                // and passing this function an Xpath query.

                // Create a collection of the nodes
                HtmlNodeCollection query = doc.DocumentNode.SelectNodes("//a[@href]");
                if (query != null)
                {
                    foreach (HtmlNode link in query)
                    {
                        // Now we just need to grab the attribute from the htmlnode
                        HtmlAttribute att = link.Attributes["href"];
                        // and add it to our list of links..but,
                        // we need to make sure that we are searching all links, or
                        // if we are excluding local links (e.g files on the same website)
                        if (excludeLocal && (att.Value.Length < 4 || att.Value.StartsWith("/") || att.Value.StartsWith("#") || att.Value.StartsWith(url)))
                        {
                            // pass
                        }
                        else
                        {
                            result.Add(att.Value);
                        }

                    }
                }
            }

            catch (Exception evt)
            {
                Console.Write(evt.ToString());
                MessageBox.Show("You entered an invalid URI. Please enter a valid URI including 'http://'" );
            }

            return result;
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            // Our user has just conducted a new search, so we need to clear the previous text display
            txt_DisplayLinks.Text = "";

            /* We also need to dispose of the last graph they drew.
             * Even though it's only possible for there to be one control
             * in our GraphTab.Controls, we will iterate through all of them
             * to be sure. */
            foreach (Control item in GraphTab.Controls)
            {
                // just to be certain, let's check that it's a graph viewer
                if (item.GetType() == typeof(GViewer))
                {
                    // if it is, let's dispose it to save memory
                    ((GViewer) item).Dispose();
                }
            }

            // finally, clear out all the controls after they've been disposed
            GraphTab.Controls.Clear();

            // Using the link they provided, search for the results.
            List<String> results = retrieveLinks(txt_targetPage.Text, chkbox_excludeLocal.Checked);

            // Construct a new Graph object to store nodes and edges
            Graph graph = new Graph("Graph of Webpage Links");
            // We do want to have a directed graph since links go in one direction
            graph.Directed = true;
            // We will use the MDS layout algorithm for nodes/edges because it looks nice
            graph.LayoutAlgorithmSettings = new Microsoft.Msagl.Layout.MDS.MdsLayoutSettings();
            // Now we are ready to pass off the list of links we built up earlier to this helper function,
            // which will add all of the links as nodes to the graph, and form edges from the links to the src
            // link (the entered in target page).

            int recursionDepth = 0;
            Int32.TryParse(cbo_RecursionDepth.Text, out recursionDepth);
            addEdges(graph, txt_targetPage.Text, results, recursionDepth);
           
            // Create a Graph Viewer object 
            GViewer viewer = new GViewer();
            // Attach our graph we've created to the viewer
            viewer.Graph = graph;
            // Set the viewer dockstyle to be 'fill'
            viewer.Dock = System.Windows.Forms.DockStyle.Fill;
            // Add the viewer to our GraphTab's controls.
            GraphTab.Controls.Add(viewer);
        }

        private void txt_targetPage_Click(object sender, EventArgs e)
        {
            // Clear the initial text
            txt_targetPage.Text = "";
        }

        private void btn_Exit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void chkbox_AllowMultEdges_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
