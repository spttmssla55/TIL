class TreeNode :
    def __init__ (self):
        self.left = None    # 왼쪽 노드
        self.data = None    # 걸그룹 이름 저장
        self.right = None   # 오른쪽 노드

## 전역변수 선언 부분
memory = []     # 만든 노드를 저장
root = None     # 트리의 맨 위 노드 
nameAry = ['블랙핑크', '레드벨벳', '마마무', '에이핑크', '걸스데이', '트와이스']

def inorder_traversal(node):
    if node is not None:
        inorder_traversal(node.left)    # 왼쪽서브트리방문
        print(node.data , end=" ")       # 현재 노드 출력
        inorder_traversal(node.right)   # 오른쪽 서브트리 방문

# main 코드 영역
if __name__ == "__main__":
    node = TreeNode()
    node.data = nameAry[0]  # 블랙핑크
    root = node             # 이 노드를 루트로 설정
    memory.append(node)     # memory 리스트에 저장

    for name in nameAry[1 : ]:  # 알파벳 순서를 기준으로 작으면 왼쪽 크면 오른쪽
        node = TreeNode()
        node.data = name
        current = root

        while True:
            if name < current.data:
                if current.left == None:
                    current.left = node
                    break
                current = current.left
            else:
                if current.right == None:
                    current.right = node
                    break
                current = current.right
                
        memory.append(node)

print("이진 탐색 트리 구성 완료")
print("memory 리스트에 저장된 노드 데이터들")
for node in memory:
    print(node.data)
print()
print("이진탐색트리의 모든 노드값 출력 중위 순회")
inorder_traversal(root)
