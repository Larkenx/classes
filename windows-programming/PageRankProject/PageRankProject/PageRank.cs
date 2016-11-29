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

namespace PageRankProject
{
    public partial class PageRank : Form
    {


        public PageRank()
        {
            InitializeComponent();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            // Our user has just conducted a new search, so we need to clear the previous text display
            txt_DisplayLinks.Text = "";

            // Create a new HTML Web object to get our HTML document
            HtmlWeb WebGet = new HtmlWeb();
            
            // We want to remove form tags because this can cause some issues
            HtmlNode.ElementsFlags.Remove("form");

            // Create new HTML Document with the HtmlAgilityPack library
            HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();

            // Fix nested tags with doc options
            doc.OptionFixNestedTags = true;

            // Now load the URL given by the user in the text box
            string url = txt_targetPage.Text;

            // Let's prepare a list of strings to store our links from the HTML document we've loaded
            List<string> links = new List<string>();

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
                        txt_DisplayLinks.AppendText(error.Reason.ToString() + '\n');
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
                        links.Add(att.Value);
                    }

                    // We now have a list of all the links on a webpage.
                    // Let's load them into our text box in the form.
                    foreach (string link in links)
                    {
                        txt_DisplayLinks.AppendText(link + '\n');
                    }

                }
            }
            catch (System.UriFormatException evt)
            {
                txt_DisplayLinks.AppendText(evt.ToString() + '\n');
            }

        }
    }
}
