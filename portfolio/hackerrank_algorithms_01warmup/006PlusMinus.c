//https://www.hackerrank.com/challenges/plus-minus

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int main(){
    int n; 
    scanf("%d",&n);
    int arr[n];
    float pos=0;
    float neg=0;
    float z=0;
    for(int arr_i = 0; arr_i < n; arr_i++){
       scanf("%d",&arr[arr_i]);
       //printf("%d\n",arr[arr_i]);
       if (arr[arr_i]>0)
           pos++;
       else if (arr[arr_i]<0)
           neg++;
       else
           z++;    
    }
    
    printf("%f\n%f\n%f",pos/n,neg/n,z/n);
    
    return 0;
}
