import random as rn
# Our
rn.seed(616)
#values of rock, paper, scissors
r,p,s = 0,1,2
#dictionary e.g., rock beats scissors
ws = {r:s, p:r, s:p}

nogames = int(input("Number of games? "))

totgames = 0
compwins = 0
robbywins = 0
ties = 0

gamehistory = []
cheats = [rn.randrange(0,3,1) for x in range(0, nogames)]
rn.seed(616)

def cheat(turn):
    compsNum = cheats[turn]
    for winner, loser in ws.items():
        if compsNum == loser:
            return winner

while totgames < nogames:
     # new computer player
     robby = cheat(totgames)
     comp = rn.randrange(0,3,1)
     gamehistory.append([robby, comp])

     print("Human: {0}, Comp: {1}".format(robby, comp))

     if ws[comp] == robby:
        compwins += 1
     elif ws[robby] == comp:
        robbywins += 1
     else:
        ties += 1
     totgames += 1

v = list(map(lambda x: 100*x/totgames, [compwins, robbywins, ties]))
print("Stats\ncw% = {0}, robby% = {1}, ties% = {2}".format(*v))
