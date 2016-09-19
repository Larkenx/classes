//
//  main.c
//  stackem_up
//
//  Created by Steven Myers on 9/17/16.
//  Copyright © 2016 Steven Myers. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>


//        if (((current->a == a) || (current->a == b)) && ((current->b == a) || (current->b == b))) {
//            printf("Got duplicate: %d %d", a, b);
//            return; /* Found duplicate */
//        }

/* Linked List of Pairs*/
typedef struct pair {
    int a;
    int b;
    struct pair *next;
} pair_t;

void push(pair_t * root, int a, int b) {
    pair_t * current = root;
    while (current->next != NULL) {
        current = current->next;
    }
    
    /* now we can add a new variable */
    current->next = malloc(sizeof(pair_t));
    printf("\nGot new pair: %d %d\n", a, b);
    current->next->a = a;
    current->next->b = b;
}

void delete_list(pair_t *head) {
    pair_t  *current = head,
    *next = head;
    
    while (current) {
        next = current->next;
        free(current);
        current = next;
    }
}

bool pair_exists(pair_t * root, int a, int b) {
    pair_t * current = root;
    while (current != NULL) {
        if (((current->a == a) && (current->b == b)) || ((current->a == b) && (current->b == a))) {
            return true;
        }
    }
    return false;
}

int find_index(int arr[], int key) {
    /* Assumes no duplicates and an arr of size 52 */
    for (int i = 0; i < 52; i++) {
        if (arr[i] == key) {
            return i;
        }
    }
    return -1;
}

void swap(int * arr[], int a, int b) {
    
}

void printCards(int cards[]) {
    for (int i = 0; i < 52; i++) {
        int suite = (cards[i] - 1) / 13;
        char * cardString = malloc(snprintf(NULL, 0, "%s", "Diamonds") + 1);
        char * suiteString;
        
        /* Get the suite */
        if (suite == 0) {
            suiteString = "Clubs";
        } else if (suite == 1) {
            suiteString = "Diamonds";
        } else if (suite == 2) {
            suiteString = "Hearts";
        } else if (suite == 3) {
            suiteString = "Spades";
        }
        /* Get the card value */
        if (i % 13 == 9) {
            cardString = "Jack";
        } else if (i % 13 == 10) {
            cardString = "Queen";
        } else if (i % 13 == 11) {
            cardString = "King";
        } else if (i % 13 == 12) {
            cardString = "Ace";
        } else {
            sprintf(cardString, "%d", (i % 13) + 2);
        }
        /* Print the card */
        printf("%s of %s\n",cardString, suiteString);
    }
}

int main(int argc, const char * argv[]) {
    /* Build the original deck, 1-52 */
    int originalDeck[52];
    for (int i = 0; i < 52; i++) {
        originalDeck[i] = i + 1;
    }
    
    
    char line[150];
    /* Get number of cases */
    int cases;
    fgets(line, sizeof line, stdin);
    sscanf(line, "%d", &cases);
    
    /* Skip the first empty line */
    fgets(line, sizeof line, stdin);
    /* For each case... */
    for (int c = 0; c < cases; c++) {
        /* Number of different shuffles and decks for each one */
        int n;
        fgets(line, sizeof line, stdin);
        sscanf(line, "%d", &n);
        int shuffles[n][52];
        /* For each shuffle... */
        for (int i = 0; i < n; i++) {
            /* Example input uses 2 lines for the shuffled decks, 26 cards per line */
            int count = 0; /* Should reach 51 */
            for (int j = 0; j != 2; j++) {
                fgets(line, sizeof line, stdin);
                int card;
                char* token = strtok(line, " ");
                while (token != NULL) {
                    if (token) {
                        card =  atoi(token);
                        shuffles[i][count] = card;
                        count++;
                    }
                    token = strtok(NULL, " ");
                }
            }
        }
        /* Now we've put all our shuffled cards in the 2d array shuffles
         * We're ready to go through and compare each shuffle against the original.
         * We will record which indices have swapped. (e.g. 1 swapped with 52, 2 swapped with 51.)
         * We will use a linked list of 'pairs' defined at the top to store the swapped indices */
        
        pair_t * swapped_pairs[n];
        for (int i = 0; i < n; i++) {
            pair_t * currentPairs = malloc(sizeof(pair_t));
            for (int j = 0; j < 52; j++) {
                /* If we find a card in a swapped spot */
                if (originalDeck[j] != shuffles[i][j]) {
                    int swappedIndex = j;
                    int oriIndex = find_index(originalDeck, shuffles[i][j]);
                    if (! pair_exists(currentPairs, swappedIndex, oriIndex))
                        push(currentPairs, oriIndex, swappedIndex);
                }
            }
            swapped_pairs[i] = currentPairs;
            delete_list(currentPairs);
        }
        printf("reached here");
        
        /* Got all of our indexes to shuffle for each shuffle */
        /* Let's now apply the shuffles given to us */
        //        while (fgets(line, sizeof line, stdin) != NULL) {
        //
        //        }
        /* End case */
    }
    
    
    return 0;
}
