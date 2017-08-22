infinity = float('inf')
# Steven Larken Myers
# Intro to AI Homework #2

# I borrowed some functions from the previous assignment's files, namely
# the MyStack and DFS implementation. They are not really used to perform the actual
# path-finding or operations to get the Robot from source to sink, but rather to determine
# if such a path exists.

# (0, 0) is in the upper left-hand corner

# stack from previous assignment
class MyStack:

    def __init__(self):
        self.stack = []

    def empty(self):
        return self.stack == []

    def pop(self):
        if self.empty():
            return None
        else:
            item = self.stack.pop()
            return item

    def push(self, item):
        self.stack.append(item)


class Robot:

    def __init__(self, x, y, dir, goal, graph):
        self.x = x
        self.y = y
        self.dir = dir
        self.start = graph.map[y][x]
        self.current_tile = graph.map[y][x]
        self.goal = goal
        self.graph = graph

    # Rotate left or right 90 degrees
    def rotate(self, change):
        if change == "left":
            self.dir += 90
            if self.dir == 360:
                self.dir = 0
            return "Rotate left 90 degrees"
        else:
            self.dir -= 90
            if self.dir == -90:
                self.dir = 270
            return "Rotate right 90 degrees"

    def forward_tile_posn(self):
        if self.dir == 0:
            return (self.x + 1, self.y)
        elif self.dir == 90:
            return (self.x, self.y - 1)
        elif self.dir == 180:
            return (self.x - 1, self.y)
        elif self.dir == 270:
            return (self.x, self.y + 1)

    def blocked_ahead(self):
        nxt = self.forward_tile_posn()
        # print "Forward tile posn is: " + str(nxt)
        if nxt[0] < 0 or nxt[0] > self.graph.width or nxt[1] < 0 or nxt[1] > self.graph.height:
            return True
        else:
            return self.graph.map[nxt[1]][nxt[0]].blocked

    # Returns true or false on whether or not the math to the right or left is blocked
    def side_path(self, dir):
        self.rotate(dir)
        blocked = self.blocked_ahead()
        opposite = "right" if dir == "left" else "left"
        self.rotate(opposite)
        return blocked


    # Transitions robot to new tile based on its current direction
    def move(self):
        nxt = self.forward_tile_posn()
        self.current_tile = self.graph.map[nxt[1]][nxt[0]]
        self.x = nxt[0]
        self.y = nxt[1]
        return "Move forward"

    # DFS implementation from graph.py in previous assignment
    def DFS(self, node):
        visited = []
        reachable = [node]
        s = MyStack()
        s.push(node)
        while not s.empty():
            v = s.pop()
            if v not in reachable:
                reachable.append(v)
            if v not in visited:
                visited.append(v)
                for w in self.graph.adj_tiles(v):
                    s.push(w)

        return reachable

    def bad_find_path(self):
        instructions = []
        dfs_path = self.DFS(self.start)
        if not self.goal in dfs_path:
            return False
        while not self.current_tile == self.goal:
            # print "Robot is at ({0}, {1}), facing {2}".format(self.x, self.y, self.dir)
            # if we've reached a dead end and need to turn around
            left_tile = self.side_path("left")
            if len(self.graph.adj_tiles(self.current_tile)) == 1 and self.blocked_ahead():
                # to turn around, rotate twice...three lefts make a shortest path?
                instructions.append(self.rotate("left"))
                instructions.append(self.rotate("left"))
                instructions.append(self.move())
            elif not left_tile:
                # print "There is a left path!"
                instructions.append(self.rotate("left"))
                instructions.append(self.move())
            else:
                instructions.append(self.move())

        return instructions

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

    def adj_tiles(self, tile):
        x = tile.x
        y = tile.y
        tiles = []
        dirs =  [(1, 0), (0, 1), (-1, 0), (0, -1)]
        for i, j in dirs:
            if i + x < 0 or i + x > self.width - 1 or y + j < 0 or y + j > self.height - 1:
                continue
            else:
                tile_to_add = self.map[y + j][x + i]
                if not tile_to_add.blocked:
                    tiles.append(tile_to_add)

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
R = Robot(2, 5, 90, G.map[1][0], G)
f = open('directions.txt', 'w')
f.truncate()
path = R.bad_find_path()
if path:
    for line in path:
        f.write(line + '\n')
else:
    f.write("No path to the goal node exists!")
