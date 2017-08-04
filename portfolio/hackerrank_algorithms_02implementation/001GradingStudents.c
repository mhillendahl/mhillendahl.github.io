//https://www.hackerrank.com/challenges/grading

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int* solve(int grades_size, int* grades, int *result_size){
    // Complete this function
    for (int i=0; i<grades_size; i++){
        //printf("%d",*(grades+i));
        if (*(grades+i)>37)
            *(grades+i) = (((*(grades+i))%5)>2) ? (*(grades+i))+(5-((*(grades+i))%5)) : *(grades+i);
        //printf("%d\n",*(grades+i));
        (*result_size)++;
    }
    
    return grades;
}

int main() {
    int n; 
    scanf("%d", &n);
    int *grades = malloc(sizeof(int) * n);
    for(int grades_i = 0; grades_i < n; grades_i++){
       scanf("%d",&grades[grades_i]);
    }
    int result_size;
    int* result = solve(n, grades, &result_size);
    //printf("result_size: %d",result_size);
    for(int result_i = 0; result_i < result_size; result_i++) {
        if(result_i) {
            printf("\n");
        }
        printf("%d", result[result_i]);
    }
    puts("");
    

    return 0;
}
