# Steven Myers
# February 18, 2017
# Gobblet Implementation in Python
import os
import sys
import types
from copy import copy, deepcopy
inf = float('inf')
sys.setrecursionlimit(100000)

def cls():
    os.system('cls' if os.name == 'nt' else 'clear')

# A tile is a stack that keeps track of its x,y location on the game board.
# A player's external pieces are also held in a tile, but has the external attribute
# set to true. If a tile is an external player's stack, then the x component is the index
# in the player.stack attribute.
class Tile:
    def __init__(self, x, y, external=False):
        self.pieces = []
        self.x = x
        self.y = y
        self.external = external
        self.name = "Tile"

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

# P1 is max, P2 is min!
class Player:
    def __init__(self, id):
        self.id = id
        self.stacks = [Tile(i, -1, True) for i in range(0, 3)]
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
                    valid_pieces = [x.peek() for x in game.threes(other_piece.owner)] # enemy piece is one of a three-in-a-row
                    if other_piece in valid_pieces:
                        print "Moved " + str(loc1) + " to " + str(inp2)
                        print "You covered up an enemy piece!"
                        raw_input("[Press Enter to end turn]")
                        loc2.push(loc1.pop())
                        game.history.append((loc1, loc2))
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
                    game.history.append((loc1, loc2))

            elif other_piece.size < piece_to_move.size: # covering one of our own pieces that is smaller
                print "Moved " + str(loc1) + " to " + str(inp2) + "."
                print "You covered up one of your own pieces!"
                raw_input("[Press Enter to end turn]")
                loc2.push(loc1.pop())
                game.history.append((loc1, loc2))


            else: # invalid move
                print "You cannot cover up a larger piece with a smaller or equally sized piece!"
                print "Please try a different move."
                raw_input("[Press Enter to return]")
                return self.play(game)
        else: # empty tile
            print "Moved " + str(loc1) + " to " + str(inp2) + "."
            raw_input("[Press Enter to end turn]")
            loc2.push(loc1.pop())
            game.history.append((loc1, loc2))

        loc2.peek().external_piece = False # if we move a piece, it must not be in the external stack anymore
        return self

class Robot(Player):
    def __init__(self, id):
        Player.__init__(self, id)

    # Overriding play method
    def play(self, game):
        # Robot generates an action via alpha beta search
        cls()
        print "{} is making a move...".format(self.id)
        action = self.alpha_beta_search(game, game.difficulty + 2)
        if action[0].external:
            p = game.current_player.stacks[action[0].x].pop()
            p.external = False
            game[action[1].y][action[1].x].push(p)
        else:
            p = game[action[0].y][action[0].x].pop()
            game[action[1].y][action[1].x].push(p)

        p, q = action[0], action[1]
        game.history.append((p,q))
        print "{} moved {} from ({},{}) to ({}, {})".format(self.id, p, p.x, p.y, q.x, q.y)
        print game
        raw_input("[Press enter to start next turn]")

    # Evaluation function for this should be the number of possibile 4-in-a-rows
    # with current player's pieces
    # Returns an action for the Robot to carry out
    def alpha_beta_search(self, state, d): # accepts a depth parameter
        acts =  state.actions()
        if self == state.p1: # MAX
            possibilities = [self.max_val(state.next(a), -1*inf, inf, state.turns + d) for a in acts]
            for v in possibilities:
                print v
            return acts[possibilities.index(max(possibilities))]

        else: # MIN
            possibilities = [self.min_val(state.next(a), -1*inf, inf, state.turns + d) for a in acts]
            return acts[possibilities.index(min(possibilities))]

    # used in Alpha-beta
    def max_val(self, state, a, b, d):
        end_game = state.terminal_test()
        if end_game != 0:
            return end_game
        elif d == state.turns:
            return state.eval()
        else:
            v = -1 * inf
            for action in state.actions():
                mval = self.min_val(state.next(action), a, b, d)
                if mval > v:
                    v = mval
                if v >= b:
                    return v
                a = v if v > a else a
            return v

    def min_val(self, state, a, b, d):
        end_game = state.terminal_test()
        if end_game != 0:
            return end_game
        elif d == state.turns:
            return state.eval()
        else:
            v = inf
            for action in state.actions():
                mval = self.max_val(state.next(action), a, b, d)
                if mval < v:
                    v = mval
                if v <= a:
                    return v
                b = v if v < b else b
            return v

    # used in Alpha-beta
    def minimax(self, state):

        def max_val(state):
            end_game = state.terminal_test()
            if end_game:
                return end_game
            else:
                v = -1 * inf
                for a in state.actions():
                    mval = min_val(state.next(a))
                    if mval > v:
                        v = mval
                return v

        def min_val(state):
            end_game = state.terminal_test()
            if end_game:
                return end_game
            else:
                v = inf
                for a in state.actions():
                    mval = max_val(state.next(a))
                    if mval < v:
                        v = mval
                return v

        acts =  state.actions()
        if self == state.p1: # MAX
            possibilities = [min_val(state.next(a)) for a in acts]
            return acts[possibilities.index(max(possibilities))]

        else: # MIN
            possibilities = [max_val(state.next(a)) for a in acts]
            return acts[possibilities.index(min(possibilities))]

class Piece:
    def __init__(self, owner, size):
        self.owner = owner
        self.external_piece = True
        self.size = size

    def __str__(self):
        return str(self.owner) + str(self.size)

    def __repr__(self):
        return str(self.owner) + str(self.size)

class Game:
    def __init__(self, p1, p2, level, time):
        self.board = []
        self.history = []
        self.difficulty = level
        self.time_limit = time
        self.turns = 1 # keeping track of many turns have passed in the game
        self.p1 = p1
        self.p2 = p2
        self.current_player = self.p1
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
        while self.terminal_test() == 0:
            self.turn()

        # if we reach this point, game is over!
        cls()
        if self.terminal_test() > 0: # P1 wins
            print self.p1.id + " won the game!"
        else: # P2 wins
            print self.p2.id + " won the game!"

        print self
        raw_input("[Press enter to print move history]")
        for p,q in self.history:
            print "{} ({},{}) to ({}, {})".format(str(p)[0] + ": ", p.x, p.y, q.x, q.y)

    # function that gets all of the pieces of a player that are a part of a 3-in-a-row
    def ninrow(self, pid, n):
        # Horizontal lines
        valid_horiz = []
        for row in self.board:
            possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, row))
            if len(possible_res) == n:
                valid_horiz += possible_res

        # Vertical lines
        valid_vert = []
        for i in range(0, 4):
            col = [self.board[j][i] for j in range(0, 4)]
            possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, col))
            if len(possible_res) == n:
                valid_vert += possible_res

        # Valid diag (upperleft to bottom right)
        valid_diag = []
        diag = [self.board[j][j] for j in range(0, 4)]
        possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, diag))
        if len(possible_res) == n:
            valid_diag += possible_res

        # Valid diag (bottom left to upperright)
        diag = [self.board[j][j] for j in range(3, -1, -1)]
        possible_res = list(filter(lambda x: x.peek() and x.peek().owner == pid, diag))
        if len(possible_res) == n:
            valid_diag += possible_res

        combined_stacks = valid_diag + valid_vert + valid_horiz
        # pieces = [s.peek() for s in combined_stacks]
        return list(set(combined_stacks))  # cleanse duplicates

    def threes(self, pid):
        return self.ninrow(pid,3)

    def twos(self, pid):
        return self.ninrow(pid, 2)

    # Alpha-beta functions. Functions are heavily based off of templates
    # given in Artificial Intelligence: A Modern Approach (3rd Edition) p. 170

    # evaluation function to award a value to some cut off node
    def eval(self):
        return 0 # len(self.threes(self.current_player)) + len(self.twos(self.current_player))

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
            print buf + str(reduce(lambda a,b: (not b == [] and b.owner == self.p2.id and bool(a)), item, True))  + '\n'
        """

        def winner(id):
            return reduce(lambda prev, item: reduce(lambda a,b: not b == [] and b.owner == id and bool(a), item, True) or prev, items, False)

        p1_win = winner(self.p1.id)
        p2_win = winner(self.p2.id)

        if p1_win:
            return inf # p1 wins
        elif p2_win:
            return -1*inf # p2 wins
        else:
            return 0 # not a terminal state

    # Returns all of the stacks containing a piece owned by current_player
    def get_stacks(self):
        stacks = [cell for row in self.board for cell in row if cell.peek() != [] and cell.peek().owner == self.current_player.id]
        p_stacks = [x for x in self.current_player.stacks if x.peek() != []]
        return (stacks + p_stacks)

    # Returns all of the possible locations a given piece can move to. This only considers the current_player
    def get_valid_locations(self, piece_loc):
        piece = piece_loc.peek()
        # Two cases - our piece is an external one (from player's stacks) or it's already on the board
        # initially fill this with all empty spaces on the board (valid locations regardless)
        # or locations with a piece that the player owns that is smaller than the current piece we're placing
        valid_locations = [x for row in self.board for x in row if x.peek() == [] or (x.peek().owner == piece.owner and piece.size > x.peek().size)]
        if piece.external_piece:
            # if it's an external piece, we can only cover enemy pieces that are part of a three-in-a-row
            # and whose size is smaller than our piece in question
            valid_locations += [x for x in self.threes(self.current_player.id) if x.peek().size < piece.size]
        else:
            # if it's not an external piece, then we can cover any enemy piece that's smaller than ours
            valid_locations += [x for row in self.board for x in row if x.peek() != [] and (x.peek().owner != piece.owner and piece.size > x.peek().size)]

        return valid_locations

    # Returns all possible moves for current state
    def actions(self):
        result = []
        for p in self.get_stacks():
            for q in self.get_valid_locations(p): # expensive?
                result.append((p, q))
        return result

    # Returns the next game if a particular action is carried out. An action is a tuple
    # of the piece to be moved and where it should be moved to.
    def next(self, action):
        next_game = deepcopy(self)
        # print self.turns
        # Need to parse the x,y coords of both components of action. Again,
        # it is possible that our first component of action (the piece to move)
        # is from the external stack, so we need to check that...
        # try:
        if action[0].external:
            p = next_game.current_player.stacks[action[0].x].pop()
            p.external = False
            next_game[action[1].y][action[1].x].push(p)
        else:
            p = next_game[action[0].y][action[0].x].pop()
            next_game[action[1].y][action[1].x].push(p)

        next_game.turns += 1
        next_game.current_player = next_game.p2 if next_game.p1 == next_game.current_player else next_game.p1
        return next_game

        # except Exception:
        #     p1 = action[0]
        #     q = action[1]
        #     print "Failed to create new game state: "
        #     print "Turn: ", str(self.turns)
        #     print str(action[0].pieces)
        #     print str(next_game[action[0].y][action[0].x].pieces)
        #     print self
        #     print next_game
        #     # print "({},{}) to ({}, {})".format(p1.x, p1.y, q.x, q.y)
        #     raw_input("")

## Players can have different character repesentations.
# Their pieces on the board are represented as a string of the player ID
# and the size of the piece. So, the smallest possible piece for player 'P' would be
# represented by a string "P1". Ownership of pieces is also linked by this player ID.
# So, player ID's cannot be the same! I am using P and Q for my example players.
test_game = Game(Player("P"), Player("Q"), 0, 0)
## Terminal State Tests...
## Row test
# test_game[0][0].push(Piece("Q", 2))
# test_game[0][1].push(Piece("Q", 3))
# test_game[0][2].push(Piece("Q", 4))
# test_game[0][3].push(Piece("P", 4))
## Column test
# test_game[0][0].push(Piece("P", 4))
# test_game[0][1].push(Piece("P", 4))
# test_game[0][2].push(Piece("P", 4))
# test_game[1][0].push(Piece("P", 4))
# test_game[2][0].push(Piece("P", 3))
# test_game[3][0].push(Piece("P", 4))
## Diag test
# test_game[0][0].push(Piece("Q", 4))
# test_game[1][1].push(Piece("Q", 4))
# test_game[2][2].push(Piece("Q", 4))
# test_game[3][3].push(Piece("P", 4))
## Diag test 2
# test_game[0][3].push(Piece("P", 4))
# test_game[1][2].push(Piece("P", 4))
# test_game[2][1].push(Piece("P", 4))
# test_game[3][0].push(Piece("P", 4))
# print test_game.terminal_test()

## Testing the Game.next method
# test_game[1][2].push(Piece("Q", 4))
# test_game[2][1].push(Piece("P", 3))
# print str(test_game.current_player) + str(test_game.turns)
# print test_game
# ng = test_game.next((test_game.p1.stacks[0], test_game[0][0]))
# print str(ng.current_player) + str(ng.turns)
# print ng

## Testing the Game.actions method
# print len(test_game.actions()) == 48 # initial move has 48 possibilities...
# for p, q in test_game.actions():
#     print "({},{}) to ({}, {})".format(p.x, p.y, q.x,q.y)
#     print test_game.next((p,q))
# test_game.start()

def gobby(players, level, time):
    g = None
    if players == "hh":
        g = Game(Player("P"), Player("Q"), level, time)
    elif players == "hr":
        g = Game(Player("P"), Robot("Q"), level, time)
    elif players == "rh":
        g = Game(Robot("P"), Player("Q"), level, time)
    elif players == "rr":
        g = Game(Robot("P"), Robot("Q"), level, time)
    else:
        print "Invalid player parameters!"
        return 0

    g.start()

gobby("rr", 2, 100)
