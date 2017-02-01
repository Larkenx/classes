# Steven Larken Myers
# Intro to AI Homework #2

# (0, 0) is in the upper left-hand corner
class Robot:

    def __init__(self, x, y, dir):
        self.x = x
        self.y = y
        self.dir = dir

    def rotate(self, change):
        if change == "left":
            self.dir -= 90
        else:
            self.dir += 90

    def move(self):
        if self.dir == 0:
            self.x += 1
        elif self.dir == 90:
            self.y -= 1
        elif self.dir == 180:
            self.x -= 1
        else:
            self.y += 1

    def a_star_search(self, graph, goal):

        def h(x):
            return 0

        def g(x):
            return 0

        start = (self.x, self.y)
        Q = PriorityQueue()

        while not Q.empty():





        return g(n) + h(n)




def create_map(handle):
    data = open(handle)
    map = []
    i = 0
    for row in data:
        map[i] = []
        i += 1
        for tile in row:
            map[i].append(int(tile))


R = Robot(0,0,0)
# R.a_star_search(0)
