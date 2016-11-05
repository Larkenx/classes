import fileinput
# Foosball Dynasty
###
# WINNER: Offense and defense player swap places. Every win constitutes a new
# dynasty

# LOSER: Offense player becomes Defense player of the same team.
# The Defense player of the team that lost the point goes to the back of the line
# and waits for their next chance to play.

# LINE: The person at the front of the line becomes the new Offense player of the team that lost the point.

#numOfPlayers = raw_input()
# W Offense, B Offense, W Def, B Def
namesOfPlayers = raw_input()
dynasties = list(raw_input())
print dynasties

line = [name for name in namesOfPlayers.split(' ')]

# Teams [Offense, Defense]
teams = {"W" : [None, None], "B" : [None, None]}
teams["W"] = [line[0], line[2]]
teams["B"] = [line[1], line[3]]

# length, team, player1, player2
currentStreak = [0, "", "", ""]
longestStreak = 0
longestWinners = list()

for (win in dynasties):
    # Update winners so far, 
    if (currentStreak[1] == win):
        currentStreak[0] += 1
    else:
        if (currentStreak[0] >= longestStreak):
            if (currentStreak[0] >= longestStreak):
                longestStreak = currentStreak[0]
            longestWinners.append([currentStreak[3], currentStreak[4]])
        currentStreak = [0, win, teams[win][0], teams[win][1] ]
