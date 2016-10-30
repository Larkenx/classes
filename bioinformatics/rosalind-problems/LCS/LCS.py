# 0 == down, 1 == right, 2 == diag

def getMax(s, i, j, match):
    a = s[i - 1][j]
    b = s[i][j - 1]
    c = s[i - 1][j - 1] + match

    if (a >= b and a >= c):
        return (-1, 0)
    elif (b >= a and b >= c):
        return (0, -1)
    elif (c >= a and c >= b):
        return (-1, -1)

def LCSBackTrack(s1, s2):
    s = [[0 for y in range(len(s2) + 1)] for x in range((len(s1) + 1))]
    backTrack = [[0 for y in range(len(s2) + 1)] for x in range((len(s1) + 1))]
    v = len(s1)
    w = len(s2)
    for i in range(0, v+1):
        s[i][0] = 0

    for j in range(0, w+1):
        s[0][j] = 0

    for row in s:
        print row

    for j in range(1, v+1):
        for i in range(1, w+1):
            print "(" + str(j) + "," + str(i) + ")"
            if (s2[i-1] == s1[j-1]):
                match = 1
            else:
                match = 0

            tup = getMax(s, i, j, match)
            s[i][j] = s[i + tup[0]][j + tup[1]]
            if (tup == (-1, -1)):
                s[i][j] += match

            if (tup == (-1, -1) and match == 1):
                backTrack[i][j] = 2
            elif (tup == (-1, 0)):
                backTrack[i][j] = 0
            elif (tup == (0, -1)):
                backTrack[i][j] = 1

    print "new matrix"
    for x in s:
        print x

    print "BackTrack"

    for y in backTrack:
        print y

    return backTrack

# where i and j are len(s1) and len(s2)
buf = ""
def OutputLCS(backTrack, v, i, j):
    global buf
    if (i == 0 or j == 0):
        return
    elif (backTrack[i][j] == 0):
        OutputLCS(backTrack, v, i - 1, j)
    elif (backTrack[i][j] == 1):
        OutputLCS(backTrack, v, i, j - 1)
    else:
        OutputLCS(backTrack, v, i - 1, j - 1)
        buf = v[i-1] + buf

s1 = "AB" # 2
s2 = "GAB" # 3
OutputLCS(LCSBackTrack(s1,s2), s1, len(s1) , len(s2))
print len(s1)
print len(s2)
f = open("output.txt", "w")
print buf
f.write(buf)
f.close()
