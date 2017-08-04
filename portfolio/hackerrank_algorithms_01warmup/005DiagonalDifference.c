//https://www.hackerrank.com/challenges/diagonal-difference

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
    int a[n][n];
    for(int a_i = 0; a_i < n; a_i++){
       for(int a_j = 0; a_j < n; a_j++){
          
          scanf("%d",&a[a_i][a_j]);
       }
    }
    
    int sum1 = 0;
    int sum2 = 0;
    int i = 0;
    int ret = 0;
    
    for (i=0;i<n;i++){    //per row
            sum1+=a[i][i];
            sum2+=a[i][n-i-1];
            //printf("%d %d %d %d\n",a[i][i],a[i][n-i-1],sum1,sum2);
    }
    
    ret = sum1-sum2;
    if (ret<0)
        ret -= (ret+ret);
        
    printf("%d",ret);
    
    return 0;
}
