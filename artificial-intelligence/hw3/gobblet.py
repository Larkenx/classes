# Steven Myers
# February 18, 2017
# Gobblet Implementation in Python
import os
import types

def cls():
    os.system('cls' if os.name == 'nt' else 'clear')

class Stack:
    def __init__(self):
        self.pieces = []

    def __repr__(self):
        return self

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

    def can_add(self, piece):
        return self.peek().size < piece.size and not self.full()

    # Removes piece at the top of the stack and returns
    def pop(self):
        return self.pieces.pop()

    # Returns whether or not the tile has any pieces - equiv to checking if pieces is empty
    def empty(self):
        return not self.pieces

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
        # Printing the play prompt...
        cls() # Clear the prompt history
        print "Game Board (" + self.id + "'s move!)"
        print "----------"
        print game
        print "Your stacks of pieces: (Game pieces are ordered by player ID and size)"
        print "----------"
        for i in range(0,3):
            print "S" + str(i+1) + ": " + str(self.stacks[i])
        print "\nInstructions:\n----------"
        print "*Enter in the name of one your stacks to select a piece from your stacks (S1, S2, S3),"
        print " or the location of the piece on the board that you want to move as a tuple like '0,0' or '1,3'"
        inp = raw_input("> ")
        # Parsing user input
        loc1 = None
        try:
            if inp[0] == "S" and int(inp[1]) in range(1,4): # user selected piece from their stacks off to the side
                loc1 = self.stacks[int(inp[1])-1]
            else: # user entered in a board location as a tuple of "x,y"
                x = int(inp[0])
                y = int(inp[2])
                loc1 = game[y][x]
            if loc1 == None or not loc1.peek().owner == self.id:
                print "That's not your piece!"
                raise ValueError()
        except Exception as e: # If anything from above failed, we know they didn't properly input the data
            print "Invalid input...Try again."
            raw_input("[Press Enter to return]")
            return self.play(game)

        # Successfully picked a piece to move...
        print "\nYou selected " + str(loc1) + " from " + inp + "!"
        print "\n*Enter the location on the board that you want to move the piece"
        inp2 = raw_input("> ")

        loc2 = None
        # Test to see if input was good...
        try:
            x = int(inp2[0])
            y = int(inp2[2])
            loc2 = game[y][x]
            if loc2 == None:
                raise ValueError()
        except Exception as e: # If anything from above failed, we know they didn't properly input the data
            print "Invalid input...Try again."
            raw_input("[Press Enter to return]")
            return self.play(game)

        if loc2.empty():
            print "\nTarget tile is an empty tile at " + inp2 + "!"
        else:
            print "\nTarget tile is " + str(loc2) + " at " + inp2 + "!"

        # successfully picked a location to move to....
        piece_to_move = loc1.peek()
        other_piece = loc2.peek()
        if other_piece: # user is trying to move piece to a tile with another piece on it
            """
            We have an important additional rule from the rules to implement... (http://www.boardspace.net/gobblet/english/gobblet_rules.pdf)
            If a new goblet is put into play, you must place it on an empty square. There is one
            exception to this rule: if your opponent already has 3 gobblets in a row on the board,
            you may gobble up 1 of the 3 pieces in the line with a gobblet taken directly from one of the external stacks
            """
            if (not other_piece.owner == self.id) and other_piece.size < piece_to_move.size: # piece is not our own and is smaller
                if inp[0] == "S": # piece came from stack
                    valid_pieces = game.threes(other_piece.owner) # enemy piece is one of a three-in-a-row
                    if other_piece in valid_pieces:
                        print "Moved " + str(loc1) + " to " + str(inp2)
                        print "You covered up an enemy piece!"
                        raw_input("[Press Enter to end turn]")
                        loc2.push(loc1.pop())
                    else:
                        print "You can't move a piece from your external stack to cover"
                        print "an enemy piece, unless that piece is a member of a three-in-a-row!"
                        print "Please try a different move."
                        raw_input("[Press Enter to return]")
                        return self.play(game)
                else: # piece already on the board, covering enemy piece
                    print "Moved " + str(loc1) + " to " + str(inp2) + "."
                    print "You covered up an enemy piece!"
                    raw_input("[Press Enter to end turn]")
                    loc2.push(loc1.pop())

            elif other_piece.size < piece_to_move.size: # covering one of our own pieces that is smaller
                print "Moved " + str(loc1) + " to " + str(inp2) + "."
                print "You covered up one of your own pieces!"
                raw_input("[Press Enter to end turn]")
                loc2.push(loc1.pop())
            else: # invalid move
                print "You cannot cover up a larger piece with a smaller or equally sized piece!"
                print "Please try a different move."
                raw_input("[Press Enter to return]")
                return self.play(game)
        else: # empty tile
            print "Moved " + str(loc1) + " to " + str(inp2) + "."
            raw_input("[Press Enter to end turn]")
            loc2.push(loc1.pop())

        return self

class Piece:
    def __init__(self, owner, size):
        self.owner = owner
        self.external_piece =
        self.size = size

    def __str__(self):
        return str(self.owner) + str(self.size)

    def __repr__(self):
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
        self.turns = 0 # keeping track of many turns have passed in the game
        self.p1 = p1
        self.p2 = p2
        self.current_player = self.p1 if self.p1.id == current_player else self.p2
        for i in range(0, 4):
            self.board.append(list()) # new row
            for j in range(0, 4):
                self.board[i].append(Tile(j, i)) # reverse x,y ordering

    def __str__(self):
        axis_str = ""
        for axis in range(0,4):
            axis_str += "    " + str(axis) + " "
        axis_str += '\n'

        items = [str(item) for row in self.board for item in row]
        return ''.join([str(i/4) + " " + str(items[i:i+4]) +'\n' for i in range(0, len(items), 4)]) + axis_str

    def __getitem__(self, key): return self.board[key]

    # Game playing functions
    def turn(self):
        self.current_player.play(self)
        self.current_player = self.p2 if self.p1 == self.current_player else self.p1
        self.turns += 1

    def start(self):
        while self.terminal_test() == -1:
            self.turn()

        # if we reach this point, game is over!
        cls()
        if self.terminal_test() == 0: # P1 wins
            print self.p1.id + " won the game!"
        else: # P2 wins
            print self.p2.id + " won the game!"

        print self

    # function that gets all of the pieces of a player that are a part of a 3-in-a-row
    def threes(self, pid):
        # Horizontal lines
        valid_horiz = []
        for row in self.board:
            possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, row))
            if len(possible_res) == 3:
                valid_horiz += possible_res

        # Vertical lines
        valid_vert = []
        for i in range(0, 4):
            col = [self.board[j][i] for j in range(0,4)]
            possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, col))
            if len(possible_res) == 3:
                valid_vert += possible_res

        # Valid diag (upperleft to bottom right)
        valid_diag = []
        diag = [self.board[j][j] for j in range(0,4)]
        possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, diag))
        if len(possible_res) == 3:
            valid_diag += possible_res

        # Valid diag (bottom left to upperright)
        diag = [self.board[j][j] for j in range(3,-1,-1)]
        possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, diag))
        if len(possible_res) == 3:
            valid_diag += possible_res

        combined_stacks = valid_diag + valid_vert + valid_horiz
        pieces = [s.peek() for s in combined_stacks]
        return list(set(pieces)) # cleanse duplicates

    # Alpha-beta functions. Functions are heavily based off of templates
    # given in Artificial Intelligence: A Modern Approach (3rd Edition) p. 170

    # Returns 0 if p1 wins, 1 if p2 wins, and -1 if no winner yet
    def terminal_test(self):
        diag_pieces_1 = [self.board[i][i].peek() for i in range(0, 4)]
        diag_pieces_2 = [self.board[3-i][i].peek() for i in range(3, -1,-1)]
        items = [diag_pieces_1, diag_pieces_2]
        for i in range(0, 4):
            items.append([self.board[j][i].peek() for j in range(0,4)])
            items.append([self.board[i][j].peek() for j in range(0,4)])

        # Helper code block that prints all possible paths
        """
        for item in items:
            buf = ""
            for p in item:
                buf += str(p) + " "
            print buf + str(reduce(lambda a,b: not b == [] and b.owner == self.p1.id and bool(a), item))  + '\n'
        """

        def winner(id):
            return reduce(lambda prev, item: reduce(lambda a,b: not b == [] and b.owner == id and bool(a), item) or prev, items, False)

        p1_win = winner(self.p1.id)
        p2_win = winner(self.p2.id)

        if p1_win:
            return 0 # p1 wins
        elif p2_win:
            return 1 # p2 wins
        else:
            return -1 # not a terminal state

    # Returns all of the stacks containing a piece owned by current_player
    def get_stacks(self):
        return [cell for row in self.board for cell in row if cell.peek() != [] and cell.peek().owner == self.current_player.id]

    # Returns all of the possible locations a given piece can move to. This only considers the current_player
    def get_valid_locations(self, piece):
        threes
        for row in self.board:
            for cell in row:
                if cell.peek() != [] and cell.peek().size <

    # Returns all possible moves up to turn N
    def actions(self, n):
        pass

    # Returns an action
    def alpha_beta_search(self):
        pass

    def p_val(self, a, b): # player 1
        pass

# Players can have different character repesentations.
# Their pieces on the board are represented as a string of the player ID
# and the size of the piece. So, the smallest possible piece for player 'P' would be
# represented by a string "P1". Ownership of pieces is also linked by this player ID.
# So, player ID's cannot be the same! I am using P and Q for my example players.

test_game = Game(Player("P"), Player("Q"), "P")
# # Terminal State Tests...
## Row test
# test_game[0][0].push(Piece("P", 2))
# test_game[0][1].push(Piece("P", 3))
# test_game[0][2].push(Piece("P", 4))
# test_game[0][3].push(Piece("P", 4))
## Column test
# test_game[0][3].push(Piece("P", 4))
# test_game[1][3].push(Piece("P", 4))
# test_game[2][3].push(Piece("P", 4))
# test_game[3][3].push(Piece("P", 4))
## Diag test
# test_game[0][0].push(Piece("P", 4))
# test_game[1][1].push(Piece("P", 4))
# test_game[2][2].push(Piece("P", 4))
# test_game[3][3].push(Piece("P", 4))
## Diag test 2
# test_game[0][3].push(Piece("P", 4))
# test_game[1][2].push(Piece("P", 4))
# test_game[2][1].push(Piece("P", 4))
# test_game[3][0].push(Piece("P", 4))
# test_game.terminal_test()

test_game[0][3].push(Piece("P", 4))
test_game[1][2].push(Piece("Q", 4))
# test_game[2][1].push(Piece("P", 4))
for x in test_game.get_stacks():
    print x
# test_game.start()
