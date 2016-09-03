#include <stdio.h>

int splitMoney(int sum, int n);

int main() {
    int n;
    while (scanf("%d", &n)) {
        int sum, d, c;
        for (int i = 0; i < n; i++) {
            scanf("%d.%d", &d, &c);
            sum = d / n;
        }
        printf("Each student must pay: %d\n", (sum / n));
    }
}
