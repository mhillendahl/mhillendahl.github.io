//https://www.hackerrank.com/challenges/apple-and-orange

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

int main(){
    int apples=0;
    int oranges=0;
    int s,t,a,b,m,n; 

    scanf("%d %d\n%d %d\n%d %d",&s,&t,&a,&b,&m,&n);
    
    int *apple = malloc(sizeof(int) * m);
    for(int apple_i = 0; apple_i < m; apple_i++){
       scanf("%d",&apple[apple_i]);
        if (apple[apple_i]>=s-a && apple[apple_i]<=t-a)
            apples++;
    }
    int *orange = malloc(sizeof(int) * n);
    for(int orange_i = 0; orange_i < n; orange_i++){
       scanf("%d",&orange[orange_i]);
        if (b+orange[orange_i]>=s && b+orange[orange_i]<=t)
            oranges++;
    }
    printf("%d\n%d",apples,oranges);
    return 0;
}
