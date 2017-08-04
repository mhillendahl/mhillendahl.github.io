//https://www.hackerrank.com/challenges/between-two-sets

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int getTotalX(int a_size, int* a, int b_size, int* b){
    // Complete this function
    int x_size=0;
    for (int x=a[a_size-1]; x<=b[0]; x = x+a[a_size-1]){
        //printf("%d",x);
        int fail = 0;
        for (int i=0;i<a_size;i++){
            if (x%a[i]!=0){
                //printf(" fail: %dmod%d",x,a[i]);
                fail=1;
                break;
            }
        }
        if (fail==0){
            for (int i=0;i<b_size;i++){
                if (b[i]%x!=0){
                    //printf(" fail: %dmod%d",b[i],x);
                    fail=1;
                    break;
                }
            }
        }
        x_size = (fail==0) ? x_size+1 : x_size;
        //printf(" (%d)\n", x_size);
    }
    return x_size;
}

int main() {
    int n; 
    int m; 
    scanf("%d %d", &n, &m);
    int *a = malloc(sizeof(int) * n);
    for(int a_i = 0; a_i < n; a_i++){
       scanf("%d",&a[a_i]);
    }
    int *b = malloc(sizeof(int) * m);
    for(int b_i = 0; b_i < m; b_i++){
       scanf("%d",&b[b_i]);
    }
    int total = getTotalX(n, a, m, b);
    printf("%d\n", total);
    return 0;
}
