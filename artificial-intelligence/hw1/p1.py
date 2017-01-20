# I will represent nodes just as strings

initial_data = {
    "U" : ["C", "L"],
    "A" : ["B"],
    "B" : ["A", "H", "J"],
    "H" : ["B", "G"],
    "C" : ["U", "I"],
    "I" : ["C"],
    "J" : ["B", "G"],
    "G" : ["H", "J", "K"],
    "F" : ["E", "D"],
    "D" : ["F", "K", "L"],
    "K" : ["G", "D"],
    "E" : ["F"],
    "L" : ["U", "D"],
}

class Graph:
    def __init__(self):
        self.data = {}

    def add_node(self, node):
        if node not in self.data.keys():
            self.data[node] = []

    def add_edge(self, node1, node2, cost=None):
        if node1 not in self.data.keys():
            print("No such node exists!")
            return
        else:
            # Append node2 to the list of node1's neighboring nodes
            self.data[node1].append(node2)

    def get_edges(self):
        edge_list = [(x,y) for x in self.data.keys() for y in self.data[x]]
        return edge_list

    def DFS(self, v, seen):
        if (v not in seen):
            seen.append(v)
            for u in self.data[v]:
                if (u not in seen):
                    self.DFS(u, seen)



# Our graph
G = Graph()

def init_room():
    # Initialize the nodes
    vertices = [x for x in initial_data.keys()]

    for v in vertices:
        G.add_node(v)

    for v in initial_data.keys():
        for u in initial_data[v]:
            G.add_edge(v, u)

init_room()

path = []
G.DFS("U", path)
print(path)
