N_list = [[0 for _ in range(101)] for _ in range(101)]
N = int(input())
for _ in range(N):
    x, y = map(int, input().split())
    for i in range(y, y + 10):
        for j in range(x, x + 10):
            N_list[i][j] = 1
ans = 0
for i in N_list:
    ans += sum(i)
print(ans)
