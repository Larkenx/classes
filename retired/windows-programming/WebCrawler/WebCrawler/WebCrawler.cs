using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using HtmlAgilityPack;
using Microsoft.Msagl.GraphViewerGdi;
using Microsoft.Msagl.Drawing;

namespace WebCrawler
{
    public partial class WebCrawler : Form
    {

        public WebCrawler()
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

        private void addEdges(Graph graph, String src, List<String> edges, int recursionDepth, TreeNode initRoot)
        {
            // If a user entered in a html link with a forward slash at the beginning,
            // it's possible for the site with and without the forward slash to be identified as different sites when in fact
            // they are the same. So, we'll just remove it if it exists
            if (src.EndsWith("/"))
            {
                src = src.Remove(src.Length - 1);
            }

            // Generate random color to use as nodes and edges for this src to aesthetically distinguish them from others
            Random rand = new Random();
            Microsoft.Msagl.Drawing.Color randomColor = new Microsoft.Msagl.Drawing.Color((byte) rand.Next(80, 255), (byte) rand.Next(80, 255), (byte) rand.Next(80, 255));

            // Strip http(s):// prefix if user chose to
            if (chkbox_stripPrefixes.Checked && src.Length > 5)
                src = src.Substring(src.IndexOf("://") + 3);

            // Add the initial root/src node with the random color from above
            graph.AddNode(src).Attr.FillColor = randomColor;

            // Our user has specified a "Recursion Depth" in the gui that corresponds to
            // how many links after the src we should visit. This means we should
            // also add the edges and nodes of the initial list of links we have,
            // and continue until the recursion depth is zero.

            txt_DisplayLinks.AppendText("\nScraping links from : (" + src + ")\n");
            txt_DisplayLinks.AppendText("--------------------------------------\n");

            // Iterate through all of the edges in our list
            foreach (String edge in edges)
            {
                // Our users have the option of stripping the prefixes (https:// or http://) from the links,
                // but if are going to recur on the edges, then we need to keep the initial prefix hanging around
                // Likewise, we need to do the same for its suffix
                String sedge = (chkbox_stripPrefixes.Checked && edge.Contains("//") && edge.Length > 5) ? edge.Substring(edge.IndexOf("//") + 2) : edge;
                if (chkbox_stripSuffixes.Checked)
                {
                    try
                    {
                        Uri targetURI = new Uri(edge);
                        //Console.Write("Found : " + sedge);
                        sedge = targetURI.Host.ToString();
                        //Console.Write("Converted to : " + sedge + '\n');
                    } catch
                    {
                        // couldn't convert it to a link, so that means it must be some sort of relative path. the predefined sedge is fine
                    }
                }
                
                // append the edge to the logs or display links textbox with a new line 
                // if the site hasn't already been added
                if (graph.FindNode(sedge) == null)
                {
                    // Add the edge as a node
                    graph.AddNode(sedge);
                }

                // Create an edge from the src to the new edge node, if one does not exist already
                if (sedge != "" && (chkbox_AllowMultEdges.Checked || ! hasEdge(graph, src, sedge)))
                {
                    // Console.WriteLine("Making edge: " + src + " -> " + sedge);
                    graph.AddEdge(src, sedge).Attr.Color = randomColor;
                    txt_DisplayLinks.AppendText(sedge + '\n');
                }

                // Now that we've added the current node, we are ready to recurse on it if we our depth is greater than or equal to 1,
                // and if the edge is a valid URI
                if (recursionDepth >= 1 && edge.StartsWith("http")) {
                    
                    if (chkbox_stripSuffixes.Checked && src.Contains(sedge))
                    {
                        // we don't want to add any nodes that contain the same domain name since we don't care
                        // about its subpages (local pages)
                    }
                    else
                    {
                        // We have to maintain the current "root node" of our tree viewer and pass it along so we can append nodes to it
                        TreeNode recursiveRoot = new TreeNode(sedge);
                        initRoot.Nodes.Add(recursiveRoot);
                        addEdges(graph, edge, retrieveLinks(edge, chkbox_excludeLocal.Checked), recursionDepth - 1, recursiveRoot);
                    }
                } else
                {
                    // Leaves, we don't recurse on 0 recursion depth
                    initRoot.Nodes.Add(new TreeNode(sedge));
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
                Uri uri = new Uri(url);
                String domainName = uri.Host.ToString();

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
                        
                        if ((excludeLocal && (! att.Value.StartsWith("http") || att.Value.Contains(domainName))))
                        {
                            // if the page is relative or contains the domain name, skip it 
                        }
                        else
                        {
                            if (!chkbox_AllowMultEdges.Checked)
                            {
                                // this guarantees we won't get duplicate edges
                                if (!result.Contains(att.Value))
                                    result.Add(att.Value);
                            }
                            else
                            {
                                // if user chose to have mult edges, don't worry about checking for them
                                result.Add(att.Value);
                            }
                        }

                    }
                }
            }

            catch (Exception evt)
            {
                // if we reach this point, it means the user probably input an invalid URI or our addEdges function
                // tried to search an invalid URI. We want to go ahead and quietly ignore an invalid URI exception,
                // except if it was the first string the user entered. In that case, we want to let them know they need to
                // to go ahead and try again.
                if (url == txt_targetPage.Text) {
                    MessageBox.Show("You entered an invalid URI. Please enter a valid URI including 'http://'");
                }
                return result;
            }

            return result;
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            // Our user has just conducted a new search, so we need to clear the previous text display
            txt_DisplayLinks.Text = "";
            // Also clear our previous tree view nodes
            treeView.Nodes.Clear();

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

            // Before we continue, we need to set up how many times this function needs to recurse on its children links.
            // To do this, we parse the 'recursion depth' from the combobox and see what our users put in. We start off
            // with the default value which is zero.
            int recursionDepth = 0;
            if (!Int32.TryParse(cbo_RecursionDepth.Text, out recursionDepth))
                MessageBox.Show("Invalid input for number of times to visit children. Using default value of 0.");

            // Finally, we need to clean up our treeView control by adding an initial root node.
            String initRoot = (chkbox_stripPrefixes.Checked && txt_targetPage.Text.Length > 5) ? txt_targetPage.Text.Substring(txt_targetPage.Text.IndexOf("://") + 3) : txt_targetPage.Text;

            TreeNode treeRoot = new TreeNode(initRoot);
            treeView.Nodes.Add(treeRoot);
            addEdges(graph, txt_targetPage.Text, results, recursionDepth, treeRoot);
           
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
            if (txt_targetPage.Text == "Type in a URL and search...") {
                txt_targetPage.Text = "";
            }
        }

        private void btn_Exit_Click(object sender, EventArgs e)
        {
            Close();
        }

    }
}
