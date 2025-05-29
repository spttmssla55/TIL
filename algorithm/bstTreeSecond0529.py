class TreeNode :
    def __init__ (self):
        self.left = None
        self.data = None
        self.right = None

## 전역변수 선언 부분
memory = []
root = None
nameAry = ['블랙핑크', '레드벨벳', '마마무', '에이핑크', '걸스데이', '트와이스']

# main 코드 영역
if __name__ == "__main__":
    node = TreeNode()
    node.data = nameAry[0]
    root = node
    memory.append(node)

    for name in nameAry[1 : ]:
        node = TreeNode()
        node,data = name

        current = root
        while True:
            if name < current.data:
                pass
