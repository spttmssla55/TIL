class LinkedQueue:
    class Node:
        def __init__(self, item, link):
            self.item = item
            self.next = link                            # 다음 번지를 link안에 넣는다 

    def __init__(self):
        print("난 LinkedQueue 기본생성자")
        self.front = None                               # 연결리스트 기반 Q의 맨 앞 노드를 가리킴
        self.rear = None                                # 연결리스트 기반 Q의 맨 뒤 노드를 가리킴
        self.size = 0

    def isEmpty(self):
        return self.size == 0

    def add(self, item):
        newnode = self.Node(item , None)
        if self.isEmpty():                          # 비어있는가?
            self.front = newnode
        else :
            self.rear.next = newnode

        self.rear = newnode
        self.size += 1

    def dispq(self):
        p = self.front         
        print("front =>", end='')
        while p:
            if p.next != None:
                print("{!s:<7}".format(p.item),            # !s -> 문자열로 변경, "<" -> 왼쪽 정렬, "7" -> 7글자만 보임임
                      "=>", end='')
            else:
                print(p.item, end='')
            
            p = p.next
        print(" :rear")

    def delete(self):
        if self.isEmpty():
            raise EmpltyError("Queue가 텅 비어있음")
        else:
            fitem = self.front.item
            oldfront = self.front
            self.front = self.front.next
            del oldfront
            self.size -= 1
            if self.isEmpty():
                self.rear = None

        return fitem
class EmptyError(Exception):
    pass

if __name__ == "__main__":
    q = LinkedQueue()
    q.add("apple")
    q.add("orange")
    q.add("cherry")
    q.add("pear")
    print("사과, 오렌지, 체리, 배 삽입후 =", end='')
    q.dispq()

    delfruit = q.delete()
    print("사과 삭제후 delfruit => ", delfruit)
    q.dispq()
    print("front 가 가리키는 orange 노드 삭제 후 queue = ")
    delfruit = q.delete()
    print("오렌지 삭제 후 delfruit = ", delfruit)
    q.dispq()


    

