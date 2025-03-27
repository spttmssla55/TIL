class SList:
    class Node:
        def __init__(self, item, link):        #__하면 생성자
            self.item = item
            self.next = link

    def __init__(self):
        print("난 SList의 생성자")
        self.head = None
        self.size = 0
    def isEmpty(self):
        return self.size == 0

    def insert_front(self,item):
        if self.isEmpty():    
            self.head = self.Node(item, None)
        else:
            self.head = self.Node(item, self.head)
        self.size += 1
    def printList(self):
        p = self.head
        while p:
            if p.next is not None:
                print(p.item , "=>", end=" ")
            else:
                print(p.item)
            p = p.next
def globalfunc():
    pass

if __name__ == "__main__":
    s = SList()                                 # 괄호 안에 self 숨어져 있음 
    s.insert_front("apple")
    s.insert_front("orange")
    s.printList()