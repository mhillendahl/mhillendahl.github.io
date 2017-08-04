//https://www.hackerrank.com/challenges/the-birthday-bar

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int solve(int n, int s_size, int* s, int d, int m){
    // Complete this function
    int squares = m; 
    int target = d;
    int ways = 0;
    for(int i=0; i<s_size+1-squares; i++){
        //printf("i=%d ",i);
        int sum=0;
        for (int j=i; j<i+squares; j++){
            sum += *(s+j);
        }
        if (sum==target){
            ways++;
            //printf("match!\n");
        }
        else{
            //printf("\n");
        }
    }

    return ways;
}

int main() {
    int n; 
    scanf("%d", &n);
    int *s = malloc(sizeof(int) * n);
    for(int s_i = 0; s_i < n; s_i++){
       scanf("%d",&s[s_i]);
    }
    int d; 
    int m; 
    scanf("%d %d", &d, &m);
    int result = solve(n, n, s, d, m);
    printf("%d\n", result);
    return 0;
}
