
# 0 == down, 1 == right, 2 == diag
def LCSBackTrack(s1, s2):
    s = [[None] * (len(s1)+1)] * (len(s2)+1)
    backTrack = [[None] * (len(s1)+1)] * (len(s2)+1)
    v = len(s1)
    w = len(s2)
    for i in range(0, v):
        s[0][i] = 0

    for j in range(0, v):
        s[j][0] = 0

    for i in range(1, v):
        for j in range(1, w):
            if (s1[i] == s2[j]):
                match = 1
            else:
                match = 0
            s[i][j] = max(s[i-1][j], s[i][j-1],(s[i-1][j-1]) + match)

            if (s[i][j] == s[i-1][j]):
                backTrack[i][j] = 0
            elif (s[i][j] == s[i][j - 1]):
                backTrack[i][j] = 1
            else:
                backTrack[i][j] = 2
                
    return backTrack

# where i and j are len(s1) and len(s2)
def OutputLCS(backTrack, v, i, j):
    if (i == 0 or j == 0):
        return
    elif (backTrack[i][j] == 0):
        OutPutLCS(backTrack, v, i - 1, j)
    elif (backTrack[i][j] == 1):
        OutPutLCS(backTrack, v, i, j - 1)
    else:
        OutPutLCS(backTrack, v, i - 1, j - 1)
        print v[i]


s1 = "AACCTTGG"
s2 = "ACACTGTGA"
backtrack = LCSBackTrack(s1,s2)
OutputLCS(backtrack, s2, len(s1), len(s2))
