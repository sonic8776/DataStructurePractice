//: [Previous](@previous)

import Foundation

class MyArray {
    var length: Int
    var data: [Int: String]
    
    init() {
        self.length = 0
        self.data = [:]
    }
    
    func get(index: Int) -> String? {
        return data[index]
    }
    
    func push(item: String) -> Int {
        data[length] = item
        length += 1
        return length
    }
    
    func pop() -> String? {
        let lastItem = data[length - 1]
        data.removeValue(forKey: length - 1)
        length -= 1
        return lastItem
    }
    
    func delete(index: Int) -> String? {
        let item = data[index]
        shiftItems(index: index)
        return item
    }
    
    func shiftItems(index: Int) {
        for i in index..<length {
            data[i] = data[i + 1]
        }
        data.removeValue(forKey: length - 1)
        length -= 1
    }
}

let newArray = MyArray()

newArray.push(item: "hi")
newArray.push(item: "you")
newArray.push(item: "!")

newArray.pop()

newArray.delete(index: 1)

print(newArray.length, newArray.data)


//: [Next](@next)
