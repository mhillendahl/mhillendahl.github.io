//https://www.hackerrank.com/challenges/mini-max-sum

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

#include <inttypes.h>

int main() {
    int *arr = malloc(sizeof(int) * 5);
    for(int arr_i = 0; arr_i < 5; arr_i++){
       scanf("%d",&arr[arr_i]);
    }
    
    __uint64_t max=0;
    __uint64_t min=0;
    __uint64_t sum=0;
    min--;
    
    for (int i=0; i<5; i++){ //keep track of every position we are leaving out
        for (int j=0; j<5; j++){ //add all vals at position j (except arr[i], when i==j)
            if (j==i)
                continue;
            sum+=arr[j];
        }
        if (sum>max)
            max=sum;
        if (sum<min)
            min=sum;
        sum=0;
    }
    
    //printf("%d %d",min, max);
    printf("%" PRIu64 " ", min);
    printf("%" PRIu64 "", max);
    return 0;
}
