# Game map is a 2D matrix of Stacks?

class Piece:

    def __init__(self,size, color):
        self.size = size
        self.color = color

# A Tile is a single cell in a 2D 4x4 game board.
# It has a pieces attribute that functions as a stack
# of game pieces. Some basic methods for stacks like peek and pop
# are implemented
class Tile:

    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.pieces = []

    # Maximum size of a piece is 4 (cannot be covered)
    def full(self):
        return self.peek().size == 4

    # Return the piece at the top of the stack
    def peek(self):
        return self.pieces[-1]

    # Add a piece to the top of the stack
    def add_piece(self, piece):
        self.pieces.append(piece)

    def pop(self):
        return self.pieces.pop()

class Game:

    def __init__(self):
        self.board = [Tile(i,j) for i in range(0, 5) for j in range(0, 5)]

print Game().board
