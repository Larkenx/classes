# Steven Myers
# February 18, 2017
# Gobblet Implementation in Python
class Stack:
    def __init__(self):
        self.pieces = []

    def __repr__(self):
        return self.pieces

    def __str__(self):
        return str(self.peek())

    # Maximum size of a piece is 4 (cannot be covered)
    def full(self):
        return self.peek().size == 4

    def push(self, piece):
        self.pieces.append(piece)
        return piece

    # Return the piece at the top of the stack
    def peek(self):
        if self.pieces:
            return self.pieces[-1]
        else:
            return []

    # Add a piece to the top of the stack
    def add_piece(self, piece):
        self.pieces.append(piece)

    def can_add(self, piece):
        return self.peek().size < piece.size and not self.full()

    # Removes piece at the top of the stack and returns
    def pop(self):
        return self.pieces.pop()

    # Returns whether or not the tile has any pieces - equiv to checking if pieces is empty
    def empty(self):
        return self.pieces


class Player:
    def __init__(self, id):
        self.id = id
        self.stacks = [Stack() for i in range(0, 3)]# game stacks, not the data structure
        for s in self.stacks:
            for i in range(0, 4):
                s.push(Piece(self.id, i+1))

    def __str__(self):
        return self.id

    def __repr__(self):
        return self

    def play(self, game):
        print game
        print "It's your turn!"
        print "Your stacks of pieces:"
        for i in range(0,3):
            print "S" + str(i) + ": " + str(self.stacks[i])
        # ... alter the game state directly ...
        raw_input("Select a piece to move: ")
        return self

class Piece:
    def __init__(self, owner, size):
        self.owner = owner
        self.size = size

    def __str__(self):
        return str(self.owner) + str(self.size)

# A Tile is a single cell in a 2D 4x4 game board. It extends my stack class,
# and only has an additional functionality of having x,y coords stored.
class Tile(Stack):
    def __init__(self, x, y):
        Stack.__init__(self)
        self.x = x
        self.y = y

class Game:
    def __init__(self, p1, p2, current_player):
        self.board = []
        self.p1 = p1
        self.p2 = p2
        self.current_player = self.p1 if self.p1.id == current_player else self.p2
        for i in range(0, 4):
            self.board.append(list()) # new row
            for j in range(0, 4):
                self.board[i].append(Tile(j, i)) # reverse x,y ordering

    def __str__(self):
        board_axes = ["A", "B", "C", "D"]
        axis_str = ""
        for axis in board_axes:
            axis_str += "    " + axis + " "
        axis_str += '\n'

        items = [str(item) for row in self.board for item in row]
        return axis_str + ''.join([str(i/4) + " " + str(items[i:i+4]) +'\n' for i in range(0, len(items), 4)])

    def __getitem__(self, key): return self.board[key]

    # Game playing functions
    def turn(self):
        self.current_player.play(self)
        self.current_player = self.p2 if self.p1 == self.current_player else self.p1

    def start(self):
        while True:
            self.turn()

    # Alpha-beta functions. Functions are heavily based off of templates
    # given in Artificial Intelligence: A Modern Approach (3rd Edition) p. 170
    def terminal_test(self):
        # diagonal win
        diag_pieces = [self.board[i][i] for i in range(0, 4)]
        p1_win = reduce(lambda a,b: b.owner == self.p1 and a, diag_pieces, True)
        p2_win = reduce(lambda a,b: b.owner == self.p2 and a, diag_pieces, True)
        if p1_win:
            return 0 # p1 wins
        elif p2_win:
            return 1 # p2 wins
        else:
            return -1 # not a terminal state


    # Returns an action
    def alpha_beta_search(self):
        pass

    def max_val(self, a, b):
        pass

    def min_val(self, a, b):
        pass

test_game = Game(Player("P"), Player("Q"), "P")
"""
# Sample game axes/positions
for i in range(0, 4):
    for j in range(0, 4):
        test_game[i][j] = Piece(j+1, board_axes[i])
"""
test_game[0][0] = Piece("P", 1)
test_game.start()
