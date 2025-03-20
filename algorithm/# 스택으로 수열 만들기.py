# 스택으로 수열 만들기
# 1 ~ n까지의 수를 스택에 저장
# push 하는 순서는 반드시 오름차순


n = int(input())  

a = []  # 수열을 저장
for i in range(n):
    num = int(input())  # 하나씩 입력
    a.append(num)  # 리스트에 추가
1
stack = []  # 스택 역할
result = []  # +, - 를 저장
current = 1  # push할 숫자

for num in a:  
    # 현재 숫자가 목표 숫자보다 작거나 같으면 push
    while current <= num:
        stack.append(current)  # 스택에 추가
        result.append("+")  # push => "+" 저장
        print("+")  
        current += 1

    # 위 숫자가 수열 값과 같으면 pop 
    if stack[-1] == num:
        stack.pop()  # 스택에서 제거
        result.append("-")  # pop => "-" 저장
        print("-")  
    else:
        print("NO")  # 못함함
        exit()  # 종료
