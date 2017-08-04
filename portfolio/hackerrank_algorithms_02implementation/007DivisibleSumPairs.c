//https://www.hackerrank.com/challenges/divisible-sum-pairs

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int divisibleSumPairs(int n, int k, int ar_size, int* ar) {
    // Complete this function
    int pairs = 0;
    
    for (int i=0, n=0; i<ar_size-1; i++)
        for (int j=i+1; j<ar_size; j++)
            pairs = ( (*(ar+i)+*(ar+j))%k==0 ) ? pairs+1 : pairs;
    
    return pairs;
}

int main() {
    int n; 
    int k; 
    scanf("%i %i", &n, &k);
    int *ar = malloc(sizeof(int) * n);
    for(int ar_i = 0; ar_i < n; ar_i++){
       scanf("%i",&ar[ar_i]);
    }
    int result = divisibleSumPairs(n, k, n, ar);
    printf("%d\n", result);
    return 0;
}
