#  Intro to Project and Testing

As a brief intro to my project, I will describe what my application does. A user enters in a URI/URL into a textbox with a few search parameters specified in checkboxes
and a drop down combobox for "recursion depth." When the user presses the search button or presses enter, the application will retreive the given URI's HTML document
and scrape the HTML doc for <a> tags and href attributes with anchor tags. It returns a list of strings (links scraped from the HTML page).

Using this list of strings, and the initial URI, I formed a directed graph data structure (built in to MSAGL) of nodges and edges, where edges indicate a link exists from
source URI to sink URI. The program keeps performing this task of scraping links from the returned list of URL's until its recursion depth set by the user initially reaches zero.
Once the graph is completely built out, it generates a visual representation using MSAGL and adds it to the "graph visualization" tab container where a user can use the 
built-in Viewer from MSAGL to explore the graph visually.

The application also dumps all of the links it visits into a "dumb" text box called Logs, and also builds a nice textual tree view control object as well. The different
search parameters can have effects both on the search space and the aesthetics of the graph that is portrayed. 

## Cases
(I DO NOT SUGGEST TESTING WITH RECURSION DEPTH GREATER THAN 1)

Theoretically, there are 32 different cases since a user can specify 4 different checkbox search settings (4*4=16), and either zero or multiple recursion(16*2=32) on neighboring websites.
I used several websites in my tests to make sure the application worked properly. Here are some of the sites I tested:

1. http://larkenx.net/ (my own personal website - it is blank and has invisible <a> tags to other html docs, who have references to all other pages in site)

	Use http://larkenx.net/ to test all of the different parameters first since it only contains a maximum of ~6 links. This will allow you to test all of the features of the
	application quickly since there's not a lot of search space and it evaluates very quickly.

2. http://www.theonion.com/ (good site because it shows how the application branches out to multiple media outlets within a recursion depth of 1-2)

3. http://fandom.wikia.com/ (I like this one since wikia has a lot of children sites (e.g. marvel.wikia, harrypotter.wikia, toystory.wikia))

4. http://www.nbcnews.com/ (very cool one, just like theonion.com because it has so many references to other media outlets)

5 http://stackoverflow.com/

6. https://www.youtube.com/ (Try doing this one with 0 recursion depth and exclude local pages enabled, the disable it.)


# Phase 2 Storyboard Feature Completion

In my phase 2 story board, I included a few extra windows forms such as "settings/options" and a pop-out window for a "graph visualization".
However, once I started building the application and moving the controls around how I wanted them, it was clear that the application, though complex in its
logical programming in the back end, is really quite simple as far as end-user usability and user-control. Moreover, I was able to put all of the controls
in a single main windows form. There is little that the user needs to control except for what is given in the main window of the program.
Whatever space I had left over in the main window, I took the time to make descriptive labels of each option that a user can enable so that it really 
wouldn't benefit the user to have a separate windows form dedicated to settings/options.

I think this approach of putting everything into one window is more akin to standard "search engine" tools we are familiar with such as a Google search.
It would be awkward for a user to open up another settings options dialog when they can simply click one of four checkboxes and perform the same
task with less mouse clicks and less menu navigation.

In the same spirit of simplicity, I combined two "data views" for my application's web link graphs into a textual format and graphical format using a tabbed container.
I think this is perfect because it's unlikely a user would want to nor need to view one at the same time. Ideally, had I had more time to work on the project, I may have
added user controls to 'pop-out' the graph as a secondary window; however, this may cause some serious performance issues because it would have to re-draw and layout the
graph which is expensive as is.

Likewise, I found that a menu bar would be largely unecessary because the commands available to the user are visually present in the main window. This is why I didn't
include these features as they were mentioned in the phase 2 storyboard.

The last feature that didn't see the light of day was the ability to customize node colors and edge colors. This is because there is no way to know ahead of time
whether there is going to be 10 nodes and 20 edges, or 1000 nodes and 4000 edges. To keep it lively and aesthetically easy to dinstugish different nodes, I randomly
generated node and edge colors and kept them the same for each iteration of my add-edges function.

# Efficiency

One major concern I had for this project was being able to reduce the time it takes to generate the graph visualization. For very connected websites and large recursion depths
it's easy for application to reach load times of ~20-40 seconds per search, and during that time our user is unable to do anything but watch the text logs fill up.
This is largely out of my control since I had no time to improve the effeciency of the framework, Microsoft Automatic Graph Layout.
This would be a massive undertaking and could possible carry some legal repercussions, and in the end it's likely I wouldn't be able to make it "faster".

In order to speed up the application's runtime, I included several cases and string-searching logic in my code to trim the search space of links I was crawling/traversing.
For example, if a webpage could not properly be visited because it's an invalid URI, I could immediately write that off and not even try to have my program recursively
search that page. Likewise, a lot of the user controls enable the user to cut down the search space based on what their needs are and what they want to see.

If a user disables multiple edges, it's a quick way to make the application hugely more efficient. Drawing hundreds of duplicate edges (multiple links leading to the same webpage)
gets real expensive, real fast - especially with big sites. This is why it's disabled by default.