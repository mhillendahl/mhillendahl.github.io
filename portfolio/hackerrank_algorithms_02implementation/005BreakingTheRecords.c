//https://www.hackerrank.com/challenges/breaking-best-and-worst-records

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int* getRecord(int s_size, int* s, int *result_size){
    // Complete this function
    
    *(result_size)=2;
    
    int max = *s;
    int min = *s;
    
    int *out = malloc(2*sizeof(int));    
    *(out) = 0;
    *(out+1) = 0;
    
    int max_i=0;
    int min_i=0;
    
    for (int i = 1; i<s_size; i++){
        if (*(s+i)>max){
            max = *(s+i);
            max_i++;
            //printf("new max %d, %d breaks\n", max, max_i);
        }
        else if ( *(s+i) < min ){
            min = *(s+i);
            min_i++; //(*(out+1) + 1);
            //printf( "new min %d, %d breaks\n",min, min_i);
        }
    }
    
    *out = max_i;
    *(out+1) = min_i;
    
    //printf("*out, *(out+1) = %d, %d\n\n", *out, *(out+1) );
    
    return out;
}

int main() {
    int n; 
    scanf("%d",&n);
    int *s = malloc(sizeof(int) * n);
    for(int s_i = 0; s_i < n; s_i++){
       scanf("%d",&s[s_i]);
    }
    int result_size;
    int* result = getRecord(n, s, &result_size);
    for(int i = 0; i < result_size; i++) {
        if (i) {
            printf(" ");
        }
        printf("%d", result[i]);
    }
    puts("");
    return 0;
}
