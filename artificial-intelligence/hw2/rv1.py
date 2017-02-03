infinity = float('inf')
# Steven Larken Myers
# Intro to AI Homework #2
# (0, 0) is in the upper left-hand corner
class Robot:

    def __init__(self, x, y, dir, goal, graph):
        self.x = x
        self.y = y
        self.dir = dir
        self.start = graph.map[y][x]
        self.goal = goal
        self.graph = graph

    # Rotate left or right 90 degrees
    def rotate(self, change):
        if change == "left":
            self.dir -= 90
        else:
            self.dir += 90

    # Transitions robot to new tile based on its current direction
    def move(self):
        if self.dir == 0:
            self.x += 1
        elif self.dir == 90:
            self.y -= 1
        elif self.dir == 180:
            self.x -= 1
        else:
            self.y += 1

    # Finds a path from the current position to the goal position if possible
    def find_path(self):
        closed_set = set()
        open_set = set({self.start})
        # Dict to keep track of shortest paths and "parents" of nodes
        parents = {
            self.graph.map[self.y][self.x] : None
        }
        # Map of costs to get to every node from start node (e.g  g(n) ...)
        g_score = {tile: tile.cost for tile in self.graph.get_tiles()}
        # We know that our starting point is zero since we're already there
        g_score[self.start] = 0

        # Heuristic scoring of each tile (this will be the distance to the goal)



class Tile:

    def __init__(self, x, y, blocked):
        self.blocked = blocked
        self.x = x
        self.y = y
        self.parent = None
        self.cost = infinity # initial cost of inf

class Graph:

    def __init__(self, map):
        self.map = map
        self.height = len(map)
        self.width = len(map[0])

    def adj_tiles(x, y):
        tiles = []
        dirs [(1, 0), (0, 1) (-1, 0), (0, -1)]
        for i, j in dirs:
            if i + x < 0 or i + x > self.width or y + j < 0 or y + j > self.height:
                continue
            else:
                tiles.append(self.map[y + j][x + i])

        return tiles

    def get_tiles(self):
        tile_list = []
        for row in self.map:
            for tile in row:
                tile_list.append(tile)

        return tile_list



def create_map(handle):
    data = [[int(j) for j in i] for i in [l.strip('\n') for l in open(handle).readlines()]]
    map = []
    for y in range(0, len(data)):
        map.append([None]*len(data[0]))
        for x in range(0, len(data[0])):
            map[y][x] = Tile(x, y, data[y][x])

    return map

G = Graph(create_map('f.txt'))
R = Robot(3, 5, 90, (0, 1), G)
R.find_path()
