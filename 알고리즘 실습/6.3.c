#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX(a,b) ((a)>(b) ? (a):(b))
 
int main() {
    int Table[15][15] = { 0, };
    
    char str1[10];   
    char str2[10];
 
    scanf("%s", str1);
    scanf("%s", str2);

    for (int i = 1; i <=strlen(str1); i++) {
        for (int j = 1; j <=strlen(str2); j++) {
            if (str1[i] == str2[j]) {
                Table[i][j] = Table[i - 1][j - 1] + 1;
            }
            else {
                Table[i][j] = MAX(Table[i - 1][j], Table[i][j - 1]);
            }
        }
    }
 
    char LCS_Str[10] = {0,};
    int LCS_len = Table[strlen(str1)-1][strlen(str2)-1]-1; 
 
    int i = strlen(str1) - 1;
    for (int j = strlen(str2) - 1; j > 0; ) {
        if (Table[i][j] == Table[i-1][j]) {
            i--;
        }
        else if (Table[i][j] == Table[i][j - 1]) {
            j--;
        }
        else if (Table[i - 1][j] == Table[i][j - 1]) { 
            LCS_Str[LCS_len--] = str2[j--];
            i--;
        }
    }
 
    printf("%d\n", Table[strlen(str1) - 1][strlen(str2) - 1]);
    printf("%s",LCS_Str);
}
