/*
  main.c
  wheels

  Created by Steven Myers on 12/15/16.
  Copyright © 2016 Steven Myers. All rights reserved.
*/

#include <stdio.h>
#include <string.h>

#define MAXMOVES 10000

int visited[MAXMOVES * 2][4];
int position = 0;

void copy(int src[4], int target[4]) {
    memcpy(target, src, sizeof(int)*4);
}

int equals(int src[4], int target[4]) {
    return memcmp(target, src, sizeof(int)*4) == 0;
}

int tried(int combination[4]) {
    int i;
    for (i = 0; i < position; i++)
        if (equals(combination, visited[i])) return 1;
    return 0;
}

int isForbidden(int combination[4], int forbiddenNum, int forbidden[forbiddenNum][4]) {
    int i;
    for (i = 0; i < forbiddenNum; i++)
        if (equals(combination, forbidden[i])) return 1;
    return 0;
}

int dial(int dir, int num) {
    if (dir == 0) { /* dial up */
        if (num == 9) return 0;
        else return num + 1;
    } else { /* dial down */
        if (num == 0) return 9;
        else return num - 1;
    }
}

void solve(int init[4], int target[4], int forbiddenNum, int forbidden[forbiddenNum][4]) {
    int q[MAXMOVES*10][4], tmp[4], i, j, moves = 0, front = 0, back = 0;
    copy(init, q[back++]);
    
    while (front != back) {
        int added = back;
        
        for (i = front; i != back; i++) {
            front++; /* pop */
            if (equals(q[i], target)) {
                printf("%d\n", moves);
                return;
            }
            
            if (isForbidden(q[i], forbiddenNum, forbidden) || tried(q[i])) continue;
            copy(q[i], visited[position++]);
            
            
            for (j = 0; j < 4; j++) { /* dial up */
                copy(q[i], tmp);
                tmp[j] = dial(0, tmp[j]);
                copy(tmp, q[added++]); /* push */
            }
            
            for (j = 0; j < 4; j++) { /* dial down */
                copy(q[i], tmp);
                tmp[j] = dial(1, tmp[j]);
                copy(tmp, q[added++]); /* push */
            }
        }
        back = added;
        moves++;
    }
    printf("-1\n");
}

int main() {
    int cases, i, j;
    scanf("%d", &cases);
    for (i = 0; i < cases; i++) {
        int init[4], target[4], forbiddenNum;
        scanf("%d %d %d %d", &init[0], &init[1],&init[2],&init[3]);
        scanf("%d %d %d %d", &target[0], &target[1],&target[2],&target[3]);
        scanf("%d", &forbiddenNum);
        int forbidden[forbiddenNum][4];
        for (j = 0; j < forbiddenNum; j++)
            scanf("%d %d %d %d", &forbidden[j][0],&forbidden[j][1],&forbidden[j][2],&forbidden[j][3]);
        
        solve(init, target, forbiddenNum, forbidden);
        position = 0;
    }
}
