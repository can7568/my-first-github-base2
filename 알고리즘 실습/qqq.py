import sys
# 플로이드 알고리즘
def floyd2(W):
    D = W #복사
    n = len(W)
    P = [[0] * n for _ in range(n)]
    for k in range(1, n):
        for i in range(1, n):
            for j in range(1, n):
                if (D[i][j] > D[i][k] + D[k][j]): # k를 경유하는 게 더 짧으면
                    D[i][j] = D[i][k ]+ D[k][j]
                    P[i][j] = k
    return D,P

# 최단경로, P[u][v] == k
def path(P,u,v):
  if(P[u][v]!=0):
    path(P,u,P[u][v])
    print('%d'%P[u][v],end=" ")
    path(P,P[u][v],v)

sys.stdin = open("input5-2.txt","r")    
INF = 999                   
N, M = map(int, input().split()) #(정점, 간선)의 개수
W = [[INF]*(N+1) for _ in range(N+1)]
for i in range(1,N+1):
    W[i][i] = 0

for i in range(M):
    u,v,w = map(int, input().split()) # 출발 정점, 도착 정점, 가중치
    W[u][v] = w

T = int(input())
for i in range(T):
   a ,b = map(int,input().split())


D,P = floyd2(W)
for i in range(1,N+1):
    for j in range(1,N+1):
        if (j == N):
          print(D[i][j])
        else:
          print(D[i][j],end=" ")
for i in range(1,N+1):
    for j in range(1,N+1):
        if (j == N):
          print(P[i][j])
        else:
          print(P[i][j],end=" ")

for i in range(1, N+1):
  for j in range(1,N+1):
    if (D[i][j] == INF):
      print("NONE")
    elif i == j and i < N:
      print(i,j)
    elif i == j and (i == N):
        print(i,j, end ="")
    else:
      print(i,end=" ")
      path(P,i,j)
      print(j)