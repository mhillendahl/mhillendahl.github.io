//https://www.hackerrank.com/challenges/birthday-cake-candles

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int birthdayCakeCandles(int n, int ar_size, int* ar) {
    int tallest = 0;
    
    for (int i=0; i<ar_size; i++){
        if (ar[i]>tallest){ //if we found a new tallest candle,
            tallest=ar[i];  //remember new tallest
            i=0;            //
            n=0;            //and start loop over
        }
        if (ar[i]==tallest) //other,
            n++;            //count tallest candles
    }
    
    return n;
}

int main() {
    int n; 
    scanf("%i", &n);
    int *ar = malloc(sizeof(int) * n);
    for(int ar_i = 0; ar_i < n; ar_i++){
       scanf("%i",&ar[ar_i]);
    }
    int result = birthdayCakeCandles(n, n, ar);
    printf("%d\n", result);
    return 0;
}
