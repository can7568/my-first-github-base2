#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAXSIZE 500

int main(void) {
  int data[MAXSIZE];
  int size;

  while (1) {
    printf("데이터의 개수를 입력하시오 (0: 종료, 30 <= x <= 500): ");
    scanf("%d", &size);
    if (size == 0)
      break;
    if (size < 30)
      continue;
    if (size > 500)
      continue;

    // srand((int)time(NULL));
    // for (int i = 0; i < size; i++){
    //   data[i] = rand() % 10;
    //   printf("%d",data[i]);
    // }
    int data[MAXSIZE] = {0,0,0,1,1,1,1,2,2,2,2,3,3,3,4,4,5,6,6,6,7,7,8,8,8,8,8,8,8,9};
    puts("\t[원 랜덤 데이터]1111");
    for (int i = 0; i < size; i++) {
      printf("%5d", data[i]);
      if (i % 10 == 9)
        puts("");
    }
    puts("");

    // 히스토그램 계산
    int histo[10] = {0};
    for (int i = 0; i < size; i++)
      histo[data[i]]++;

    // 히스토그램 출력
    puts("\t[히스토그램]");
    for (int j = 0; j < 10; j++) {
      printf("%5d | %d\n", j, histo[j]);
    }
    puts("");

    // 히스토그램 v1.0 출력
    puts("\t[히스토그램 v1.0]");
    for (int j = 0; j < 10; j++) {
      printf("%5d | ", j);
      for (int k = 0; k < histo[j]; k++) {
        printf("*");
      }
      printf("\n");
    }
    puts("");

    // 히스토그램 v2.0 출력
    puts("\t[히스토그램 v2.0]");
    int max = 0;
    for (int j = 0; j < 10; j++) {
      if (histo[j] > max)
        max = histo[j];
    }
    for (int j = max + 2; j >= 1; j--) {
      printf("%5d  | ", j);
      for (int k = 0; k < 10; k++) {
        if (j == histo[k] + 1) {
          printf(" %2d  ", histo[k]);
          if (k == 9)
            printf("\n");
        } else if (j <= histo[k]) {
          printf("  *  ");
          if (k == 9)
            printf("\n");
        } else {
          printf("     ");
          if (k == 9)
            printf("\n");
        }
      }
    }
    printf("       +----------------------------------------------------\n");
    printf("           0    1    2    3    4    5    6    7    8    9   \n");
    puts("");

    // 히스토그램 v3.0 출력
    puts("\t[히스토그램 v3.0]");
    for (int j = 0; j < 10; j++) {
      if (histo[j] > max)
        max = histo[j];
    }
    for (int j = max + 2; j >= 1; j--) {
      if (j % 5 == 0) {
        printf("%5d  | ", j);
      } else
        printf("       | ");
      for (int k = 0; k < 10; k++) {
        if (j <= histo[k]) {
          printf(" %2d  ", histo[k]);
          histo[k]--;
          if (k == 9)
            printf("\n");
        } else {
          printf("     ");
          if (k == 9)
            printf("\n");
        }
      }
    }
    printf("       +----------------------------------------------------\n");
    printf("           0    1    2    3    4    5    6    7    8    9   \n");
    puts("");

    // 히스토그램 v4.0
    puts("\t[히스토그램 v4.0]");
    for (int j = 0; j < 10; j++) {
      if (histo[j] > max)
        max = histo[j];
    }

    for (int j = max + 2; j >= 1; j--) {
      float m = histo[j] / size;
      if (j == 0) {
        printf("%5.2f  | ", m);
      } else
        printf("       | ");
      for (int k = 0; k < 10; k++) {
        if (j <= histo[k]) {
          printf(" +-+ ", histo[k]);
          if (k == 9)
            printf("\n");
        } else {
          printf(" | | ");
          if (k == 9)
            printf("\n");
        }
      }
    }
    printf("       +——————————————————————————\n");
    printf("           0    1    2    3    4    5    6    7    8    9   \n");
    puts("");
  }
}