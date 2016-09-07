#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[80];
    int votes[20]; /* Each element from 0 to n represent preference of votes 0 = first */
} candidate;

int main(int argc, char const *argv[]) {
    int cases;
    scanf("%d", &cases);
    for (int i = 0; i < cases; i++) {
        int n; /* Number of candidates */
        scanf("%d", &n);
        candidate candidates[n]; /* Create an array of the candidates, ordering from 0 to n */

        for (int j = 0 ; j < n; j++) {
            candidate curr;
            scanf("%s", curr.name); /* Scans for the name of candidate and populates it */
            candidates[j] = curr;
        }

        /* Now we have an array of the candidates */
        int currVotes[n]; /* elements from 0 to n are ranked from most preferred to least preferred */
        char buf[2];
        while (scanf("%1[^\n]", buf) == 0) { /* Until we hit a new line */
            for (int i = 0; i < n; i++) {
                scanf("%d", &currVotes[i]); /* Put the vote count in currVote array */
                candidate* votedFor = &candidates[currVotes[i]];
                votedFor->votes[i]++; /* increment votes for candidate at the received preference */
            }
        }
    }

    return 0;
}


