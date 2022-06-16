#include <stdio.h>
#include <stdlib.h>
#define MAX 100
#define LINEITEM 10

int main(){
    int cnt = 0;
    for (int i =1;i<=100;i++){
        if (i % 2 == 0){
            continue;
        }
        else if (i % 3 == 0){
            continue;
        }
        else if(i % 5 == 0 ){
            continue;
        }
        else if (i % 7==0){
            continue;
        }
        else{
            
            if (cnt % LINEITEM != 0){
                printf("%2d  ",i);
            }
            else{
                printf("\n%2d  ",i);
            }
            cnt +=1;
        }
    }
    return 0;
}