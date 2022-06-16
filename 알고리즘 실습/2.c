#include <stdio.h>

int main()
{
    int x, y, k;

    printf("x부터 : ");
    scanf("%d", &x);
    printf("y까지 : ");
    scanf("%d", &y);
    int p;
    p = x;
    for(x=x; x<=y; x++)
    {
        for(k=1; k<=y-x; k++)
        {
            printf(" ");
        }
      
        for(k=x; k>=p; k--)
        {
            printf("%d", k);
        }

        printf("\n");
    }

    return 0;
}