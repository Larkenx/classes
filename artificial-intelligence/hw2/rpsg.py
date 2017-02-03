# Rock, Paper, Scissors game copied from code given in last assignment

import random as rn

#values of rock, paper, scissors
r,p,s = 0,1,2
#dictionary e.g., rock beats scissors
ws = {r:s, p:r, s:p}

nogames = int(input("Number of games? "))

totgames = 0
comp_loses_since_bet = 0
comp_wins_since_bet = 0
compwins = 0
compcash = 100
humcash = 100
humwins = 0
ties = 0

gamehistory = []


while totgames < nogames:
    if compcash < 10:
        print("The computer has run out of money, so the human wins!")
        break
    if humcash < 10:
        print("You've run out of money! The computer wins.")
        break
    human = int(input("Choose Rock, Paper, or Scissors\n--------\nr=0,p=1,s=2 "))
    hbet = int(input("How much do you want to bet? You can bet up to ${0} dollars.\n> $".format(min(humcash, compcash))))
    while hbet > min(humcash, compcash) or hbet < 10:
        print("Your bet must be at least 10 dollars, or within the maximum amount! Try again.")
        hbet = int(input("How much do you want to bet? You can bet up to ${0} dollars. >".format(min(humcash, compcash))))

    comp = rn.randrange(0,3,1)
    cbet = 10 # assume we start out with 10 as computer bet, but we'll do some analysis on the game history
    if comp_loses_since_bet >= 3:
        cbet *= 3 # since we've lost three times in a row, our chances are fairly good we'll win relatively soon so let's triple the bet
    # these two are mutually exclusive
    if comp_wins_since_bet >= 2:
        cbet *= 2 # we're on a bit of winning streak, so let's try doubling down
    print("The computer bets ${0}".format(cbet))
    gamehistory.append([human, comp])
    humcash -= hbet
    compcash -= cbet
    pot = hbet + cbet # the total of the human and computer bets, winner takes all

    print("Human: {0}, Comp: {1}".format(human, comp))

    if ws[comp] == human:
        print "Computer wins and takes the pot worth ${0}".format(pot)
        compcash += pot
        compwins += 1
        comp_wins_since_bet += 1
        comp_loses_since_bet = 0
    elif ws[human] == comp:
        print "Human wins and takes the pot worth ${0}".format(pot)
        humcash += pot
        humwins += 1
        comp_wins_since_bet = 0
        comp_loses_since_bet += 1
    else: # in a tie, nobody loses their bets
        print("It's a tie! Everyone gets their money back.")
        compcash += cbet
        humcash += hbet
        ties += 1
    totgames += 1

    print("\nCash Totals\n--------\nHuman ${0}\nComputer ${1}\n".format(humcash, compcash))

v = list(map(lambda x: 100*x/totgames, [compwins, humwins, ties]))
print("Stats\n--------\\ncw% = {0}, hm% = {1}, ties% = {2}".format(*v))
