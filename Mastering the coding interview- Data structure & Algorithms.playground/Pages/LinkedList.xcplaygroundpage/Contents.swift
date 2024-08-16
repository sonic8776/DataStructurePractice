import Foundation

/*
 class LinkedList {
 constructor(value) {
 this.head = {
 value: value,
 next: null
 };
 this.tail = this.head;
 this.length = 1;
 }
 append(value) {
 //Code here
 }
 }
 
 let myLinkedList = new LinkedList(10);
 myLinkedList.append(5);
 myLinkedList.append(16);
 */

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next else { return "\(value)" }
        return "\(value) -> \(next)"
    }
}

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    var length: Int
    
    init(_ value: Value) {
        self.head = Node(value: value, next: nil)
        self.tail = head
        self.length = 1
    }
    
    // O(1)
    mutating func append(_ value: Value) {
        let newNode = Node(value: value, next: nil)
        self.tail?.next = newNode
        self.tail = newNode
        self.length += 1
    }
    
    // O(1)
    mutating func prepend(_ value: Value) {
        let newNode = Node(value: value, next: nil)
        newNode.next = self.head
        self.head = newNode
        self.length += 1
    }
    
    mutating func insert(index: Int, value: Value) {
        if index >= self.length {
            append(value)
            return
        }
        
        let newNode = Node(value: value, next: nil)
        // 找到指定 index 的前一個 node
        let leader = traverseToIndex(index - 1)
        // 找到指定 index 原本的 node 先暫存起來
        let holdingPointer = leader?.next
        // 把 leader.next 改成要插入的 node
        leader?.next = newNode
        // 把原本暫存的 node 接回去
        newNode.next = holdingPointer
        // 更新長度
        self.length += 1
    }
    
    mutating func remove(index: Int) {
        // 找到指定 index 的前一個 node
        let leader = traverseToIndex(index - 1)
        // 找到指定 index 的 node
        let unwantedNode = leader?.next
        // 把前一個 node.next 改為後一個 node
        leader?.next = unwantedNode?.next
        
        self.length -= 1
    }
    
    // while loop 讓時間複雜度變為 O(n)
    func traverseToIndex(_ index: Int) -> Node<Value>? {
        var counter = 0
        var currentNode = self.head
        while counter != index {
            currentNode = currentNode?.next
            counter += 1
        }
        return currentNode
    }
    
    mutating func reverse() -> Node<Value>? {
        if head?.next == nil {
            // just one element so no need to reverse
            print("do nothing, list is already reversed")
            return head
        }
        
        var previous: Node<Value>? = nil
        var currentNode = head
        tail = currentNode
        var next: Node<Value>? = nil
        
        while (currentNode != nil) {
            next = currentNode?.next
            currentNode?.next = previous
            previous = currentNode
            currentNode = next
        }
        head?.next = nil
        head = previous
        print(head, tail)
        return previous
    }
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        return "\(String(describing: head))"
    }
}

var myLinkedList = LinkedList(10)
myLinkedList.append(5)
myLinkedList.append(16)
myLinkedList.prepend(1)
myLinkedList.insert(index: 2, value: 99)
myLinkedList.remove(index: 2)
myLinkedList.remove(index: 2)
dump(myLinkedList)
print(myLinkedList)
print("===========================")
print(myLinkedList.reverse())
