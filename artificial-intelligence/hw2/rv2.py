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


    def BFS(self):
        visited = set()
        visited.add(self.current_tile)
        parents = {tile:tile for tile in self.graph.get_tiles()}
        Q = [self.current_tile]
        while len(Q) > 0:
            v = Q.pop(0) # pop from the top of the Q (list)
            for u in self.graph.adj_tiles(v):
                if u is self.goal: # reached our goal, mark it in our parent and we're done
                    # print "{0}, {1} is the parent of {2}, {3}".format(v.x, v.y, u.x, u.y)
                    parents[u] = v
                    visited.add(u)
                    break
                if not u in visited:
                    parents[u] = v # make v the parent of u (its neighbor)
                    # print "{0}, {1} is the parent of {2}, {3}".format(v.x, v.y, u.x, u.y)
                    Q.append(u)
                    visited.add(u) # then visit it

        # we've now calculated (generated) the parents hashmap for vertices
        # and we're ready to backtrack from the goal node to our current tile
        path_to_goal = []
        current_step = self.goal
        if self.goal not in visited:
            return False # we never visited the goal node - thus, it is unreachable
        while not current_step == self.current_tile:
            # print current_step.x, current_step.y
            path_to_goal.insert(0, current_step)
            current_step = parents[current_step]

        return path_to_goal

    def better_find_path(self):
        path_to_goal = self.BFS()
        if not path_to_goal: # error when we try and search when no path exists
            error("No path exists!")

        instructions = []
        while not self.current_tile == self.goal:
            next_tile = path_to_goal.pop(0)
            if not self.forward_tile_posn() == (next_tile.x, next_tile.y): # not directly ahead of us so we either need to rotate left or right
                self.rotate("left")
                left_tile = self.forward_tile_posn()
                self.rotate("right")
                self.rotate("right")
                right_tile = self.forward_tile_posn()
                self.rotate("left")
                if right_tile == (next_tile.x, next_tile.y):
                    instructions.append(self.rotate("right"))
                    instructions.append(self.move())
                elif left_tile == (next_tile.x, next_tile.y):
                    instructions.append(self.rotate("left"))
                    instructions.append(self.move())
                else:
                    error("Robot got lost in a dead end - clearly didn't follow the directions...")
            else:
                instructions.append(self.move())

        return instructions

    def bad_find_path(self):
        instructions = []
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
                print "There is a left path!"
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
f = open('directions2.txt', 'w')
f.truncate()
path = R.better_find_path()
if path:
    for line in path:
        f.write(line + '\n')
else:
    f.write("No path to the goal node exists!")
