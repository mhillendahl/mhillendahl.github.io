//https://www.hackerrank.com/challenges/kangaroo

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>

char* kangaroo(int x1, int v1, int x2, int v2) {
    while(1){
        if (x1==x2)
            return "YES";        
        if ( (x1>x2 && v1>=v2) || (x2>x1 && v2>=v1) )
            return "NO";
        x1+=v1;
        x2+=v2;
    }
}

int main() {
    int x1,v1,x2,v2, result_size;
    scanf("%i %i %i %i", &x1, &v1, &x2, &v2);
    char* result = kangaroo(x1, v1, x2, v2);
    printf("%s\n", result);
    return 0;
}
