
# Evaluation function for this should be the number of possibile 4-in-a-rows
# with current player's pieces
# Returns an action for the Robot to carry out
def alpha_beta_search(self, state):
    acts =  state.actions()
    if self == state.p1: # MAX
        possibilities = [self.min_val(state.next(a), -1*inf, inf) for a in acts]
        return acts[possibilities.index(max(possibilities))]

    else: # MIN
        possibilities = [self.max_val(state.next(a), -1*inf, inf) for a in acts]
        return acts[possibilities.index(min(possibilities))]

# used in Alpha-beta
def max_val(self, state, a, b):
    end_game = state.terminal_test()
    if end_game:
        return end_game
    else:
        v = -1 * inf
        for action in state.actions():
            mval = self.min_val(state.next(action), a, b)
            if mval > v:
                v = mval
            if v >= b:
                return v
            a = v if v > a else a

        return v

# used in Alpha-beta
def min_val(self, state, a, b):
    end_game = state.terminal_test()
    if end_game:
        return end_game
    else:
        v = inf
        for action in state.actions():
            mval = self.min_val(state.next(action), a, b)
            if mval < v:
                v = mval
            if v <= a:
                return v
            b = v if v < b else b
        return v
