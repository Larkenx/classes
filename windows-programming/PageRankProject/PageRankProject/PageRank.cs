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

        private List<String> retrieveLinks(String url)
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
                if (doc.ParseErrors != null && doc.ParseErrors.Count() > 0)
                {
                    // If we have any issues parsing the html document, we can analyze them here
                    foreach (HtmlAgilityPack.HtmlParseError error in doc.ParseErrors)
                    {
                        result.Add(error.Reason.ToString() + '\n');
                    }

                }
                else
                {
                    // Create a collection of the nodes
                    HtmlNodeCollection query = doc.DocumentNode.SelectNodes("//a[@href]");

                    foreach (HtmlNode link in query)
                    {
                        // Now we just need to grab the attribute from the htmlnode
                        HtmlAttribute att = link.Attributes["href"];
                        // and add it to our list of links
                        result.Add(att.Value);
                    }

                    // We now have a list of all the links on a webpage.
                    // Let's load them into our text box in the form.
                    foreach (string link in result)
                    {
                        txt_DisplayLinks.AppendText(link + '\n');
                    }

                }
            }
            catch (System.UriFormatException evt)
            {
                result.Add(evt.ToString() + '\n');
            }

            return result;
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            // Our user has just conducted a new search, so we need to clear the previous text display
            txt_DisplayLinks.Text = "";

            // Using the link they provided, search for the results.
            List<String> results = retrieveLinks(txt_targetPage.Text);

            // We need to do two things with our results we got back. We need to add
            // each edge to the textbox showing all of the links dumped into the textbox.
            // but we also need to form a graph, with each of these links we got back as
            // edges from the root node (searched node).

            Graph graph = new Graph("graph");
            graph.AddNode(txt_targetPage.Text);

            // Put the results in the text box for the user to see
            foreach (String result in results)
            {
                txt_DisplayLinks.AppendText(result);
                graph.AddNode(result);
                graph.AddEdge(txt_targetPage.Text, result);
            }

            GViewer viewer = new GViewer();
            viewer.Graph = graph;
            //associate the viewer with the form 
            SuspendLayout();
            viewer.Dock = System.Windows.Forms.DockStyle.Fill;
            Controls.Add(viewer);
            ResumeLayout();
            //show the form 
            ShowDialog();


        }
    }
}
