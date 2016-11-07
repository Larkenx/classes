import random

slots = dict()

def hash(k, n):
    position = k / n
    if (not position in slots):
        slots[position] = 1
    else:
        slots[position] += 1

for i in range(0, 25):
    hash(i, 25)

print slots
