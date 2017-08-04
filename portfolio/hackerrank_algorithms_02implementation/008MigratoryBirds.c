//https://www.hackerrank.com/challenges/migratory-birds

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int migratoryBirds(int n, int ar_size, int* ar) {
    // Complete this function
    
    int A[5]={0,0,0,0,0};
    int out=0;
    
    for (int i=0; i<ar_size; i++)
        A[ar[i]-1]++;
    
    for (int i=0; i<5; i++){
        //printf("%d ", A[i]);
        if(A[i]>A[out-1])
            out = i+1;
    }
    //puts(" ");
    
    return out;
}

int main() {
    int n; 
    scanf("%i", &n);
    int *ar = malloc(sizeof(int) * n);
    for(int ar_i = 0; ar_i < n; ar_i++){
       scanf("%i",&ar[ar_i]);
    }
    int result = migratoryBirds(n, n, ar);
    printf("%d\n", result);
    return 0;
}
