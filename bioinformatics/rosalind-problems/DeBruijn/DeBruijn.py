import filecmp

def printHelper(arr, i):
    result = ""
    for x in arr[i]:
        result = result + x + ","
    return result[:-1] # strip the last comma and whitespace

def DeBruijn(fileName):
    f = open(fileName, "r")
    patterns = [x.strip('\n') for x in f.readlines()]
    f.close()
    patterns.sort()
    prefixes = []
    for pattern in patterns:
        current = pattern[:-1]
        if (not current in prefixes):
            prefixes.append(current)
    # Now we have all the possible prefixes
    result = list([] for foo in xrange(len(prefixes)))
    for pattern in patterns:
        current = pattern[:-1]
        if (current in prefixes):
            result[prefixes.index(current)].append(pattern[1:])

    # Print our result
    f = open("output.txt", 'w')
    f.truncate()
    for x in range(len(prefixes)):
        f.write(prefixes[x])
        f.write(" -> ")
        f.write(printHelper(result, x))
        f.write('\n')

DeBruijn("sample.txt")
# print filecmp.cmp("output.txt", "proper_output.txt")
