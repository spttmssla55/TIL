class SList:
    class Node:
        def __init__(self, item, link):
           self.item = item
           self.next = link

    def __init__(self):
        print("난 SList의 생성자")
        self.head = None
        self.size = 0
        
    def isEmpty(self):
        return self.size == 0

    def insert_front(self, item):
        if self.isEmpty():
            self.head = self.Node(item , None)
        else:
            self.head= self.Node(item, 
                                self.head)
        self.size += 1

    def insert_after(self, item, p):
        p.next = self.Node( item, p.next)
        self.size += 1

    def search(self, target):
        p = self.head
        for k in range(self.size):          # k -> 0
            if target == p.item:            # 찾는 값이 노드 안에 있나 확인
                return k                    # 있다면 리턴
            p = p.next                      # 없다면 next를 통해 다음 주소값을 가리키게게 함


    def delete_after(self, p):              # p가 참조하는 노드의 다음 노드를 삭제
        if self.isEmpty():
            print("리스트가 비어있어서 삭제불가")
            return None
        else:
            t = p.next                      # t는 삭제할 노드를 가리키는 변수임
            p.next = t.next
            del t
            self.size -= 1

    def delete_front(self):
        if self.isEmpty():
            print("리스트가 비어있어서 삭제불가")
            return None
        else:
            t = self.head
            self.head = self.head.next
            del t
            self.size -= 1

    def insert_index(self, index, item):            # 사용자가 원하는 인덱스에 새로운 노드 삽입하는 함수     
        if index < 0 or index > self.size:  # 인덱스 처리
            print("잘못된 인덱스입니다.")
            return
        
        if index == 0:  # 첫 번째 삽입
            self.insert_front(item) 
        else:
            p = self.head
            for i in range(index - 1):  # 전까지 이동
                p = p.next
            
            new_node = self.Node(item, p.next)  # 노드 생성
            p.next = new_node 

        self.size += 1 



    def delete_index(self, index):              # 사용자가 원하는 인덱스에 있는 노드 삭제하는 함수
        if index < 0 or index >= self.size:  
            print("잘못된 인덱스입니다.")
            return None
    
        if index == 0:  # 첫 번째 삭제
            self.head = self.head.next  # 다음 노드로 변경
        else:
            p = self.head
            for i in range(index - 1):  # 전까지 이동
                p = p.next

        p.next = p.next.next
    
        self.size -= 1 

    def delete_final(self):                         # 연결리스트의 맨 마지막 노드를 삭제하는 함수
        if self.isEmpty():  # 비어 있으면 삭제X
            print("리스트가 비어있어 삭제할 수 없습니다.")
            return None

        if self.head.next is None:
            self.head = None  # 첫 번째 삭제
        else:
            p = self.head
            while p.next and p.next.next:  # 마지막 직전까지 이동
                p = p.next

        p.next = None

        self.size -= 1

    def printList(self):
        p = self.head
        while p:
            if p.next  is not None:
                print(p.item , "=>", end="")
            else:
                print(p.item)
            p = p.next

def globalFunc():
    pass

if __name__ == "__main__":
    s = SList()
    s.insert_front("apple")
    s.insert_front("orange")
    s.printList()
    s.insert_after("cherry", s.head.next)           # 다음 노드에 추가
    s.printList()
    s.insert_front("pear")                          # 첫 노드에 추가
    s.insert_front("melon")
    s.insert_front("strawberry")
    s.insert_front("grape")
    s.insert_front("peach")
    s.insert_front("banana")
    s.printList()
    print("cherry는 %d번쨰 노드에 있다." %
          (s.search("cherry")+1))
    s.delete_after(s.head)
    s.printList()

    s.delete_front()
    print("첫번쨰 노드 삭제후 \t\t")
    s.printList()

    # 실습 과제 함수 작성성
    
    s.insert_index(2, "melon")    
    s.delete_index(3)
    s.delete_final()
    s.printList()
