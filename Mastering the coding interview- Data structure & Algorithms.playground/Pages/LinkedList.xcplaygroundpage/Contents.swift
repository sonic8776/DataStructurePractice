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
dump(myLinkedList)
print(myLinkedList)
