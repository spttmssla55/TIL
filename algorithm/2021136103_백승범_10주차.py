# 2021136103 백승범 
import sys
sys.setrecursionlimit(10000)

# 함수 정의
def dfs(v):
    visited[v] = True                          # 노드 처리
    for u in graph[v]:                         
        if not visited[u]:                     # 방문하지 않은 노드
            dfs(u)                             

# 입력 받기
n, m = map(int, input().split())               # n: 노드 수 //  m: 간선 수
graph = [[] for _ in range(n + 1)]             # 인접 초기화
visited = [False] * (n + 1)                    # 기록 초기화

# 간선 정보 입력
for _ in range(m):
    u, v = map(int, input().split())           
    graph[u].append(v)                         # 양쪽 추가
    graph[v].append(u)

# 연결 요소 개수 세기
count = 0
for i in range(1, n + 1):                      # 모든 노드 반복
    if not visited[i]:                         # 방문하지 않았다면
        dfs(i)
        count += 1                             # 연결 요소 개수 증가

# 결과 출력
print(count)
