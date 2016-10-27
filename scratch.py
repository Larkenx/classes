from bearlibterminal import terminal

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move(self, dx, dy):
        self.x += dx
        self.y += dy

    def distanceTo(otherPoint):
        pass

    def add(self, otherPoint):
        self.x += otherPoint.x
        self.y += otherPoint.y

# Generic Character class
class Character:
    def __init__(self, pos, icon):
        self.pos = pos
        self.icon = icon
        # Base HP, Attack, and Armor
        self.hp = 10
        self.attack = 1
        self.armor = 2

    def move(self, otherPoint):
        self.pos.add(otherPoint)

# mapping terminal keys to actions
movements = {terminal.TK_A : Point(-1, 0),
             terminal.TK_D : Point(1, 0),
             terminal.TK_W : Point(0, -1),
             terminal.TK_S : Point(0, 1)}


initial_start = Point(5, 5)
player = Character(initial_start, "@")

def launch():
    terminal.open()
    terminal.printf(player.pos.x, player.pos.y, player.icon)
    terminal.refresh()
    # Initialize the current event (evt)
    evt = terminal.read()
    while (evt != terminal.TK_CLOSE):
        if (evt in movements):
            player.move(movements[evt])
            terminal.clear()
        terminal.printf(player.pos.x, player.pos.y, player.icon)
        terminal.refresh()
        evt = terminal.read()
    terminal.close()

launch()
