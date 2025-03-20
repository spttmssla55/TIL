# 2021136103 백승범

# stack에 값을 추가
def push(item):
    global top
    stack.append(item)
    top += 1

# stack에 값을 뻄
def pop():
    global top  
    if len(stack) != 0:
        item = stack.pop(top)
        top -= 1
        return item



stack = []
top = -1        # stack이 비어있는 상태에서 top은 -1로 초기화

if __name__ == "__main__" :
    push("apple")
    push("orange")
    push("cherry")
    print("apple,orange,cherry를 push후 =\t", end="")
    print(stack,"\t <- top")
    print("TOP 항목 =", end = '')
    topvalue = pop()    # pop해서 top 항목을 가져옴
    print("topvalue =", topvalue)
    push("pear")    # pear를 추가
    print("apple,orange,cherry를 push후 =\t", end="")
    print(stack,"\t <- top")
    topva12 = pop() 
    print(topva12)
