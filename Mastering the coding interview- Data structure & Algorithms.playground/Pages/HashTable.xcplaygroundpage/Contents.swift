//: [Previous](@previous)

import Foundation

class HashTable {
    var data: [[(key: String, value: Int)]]
    
    init(size: Int) {
        self.data = Array(repeating: [], count: size)
    }
    
    // O(1)
    private func hash(_ key: String) -> Int {
        var hash = 0
        for (index, char) in key.enumerated() {
            hash = (hash + Int(char.asciiValue!) * index) % data.count
        }
        return hash
    }
    
    // O(1)
    func set(key: String, value: Int) {
        let address = hash(key)
        data[address].append((key, value))
    }
    
    // O(1) (if collision -> O(n))
    func get(key: String) -> Int? {
        let address = hash(key)
        let currentBucket = data[address]
        for entry in currentBucket {
            if entry.key == key {
                return entry.value
            }
        }
        return nil
    }
    
    // O(n), deal with collision
    func keys() -> [String] {
        var keysArray = [String]()
        for i in 0..<data.count {
            if !data[i].isEmpty {
                if data.count > 1 {
                    // handle collision
                    for j in 0..<data[i].count {
                        keysArray.append(data[i][j].key)
                    }
                } else {
                    keysArray.append(data[i][0].key)
                }
            }
        }
        return keysArray
    }
}

let myHashTable = HashTable(size: 50)
myHashTable.set(key: "grapes", value: 10000)
myHashTable.get(key: "grapes")
myHashTable.set(key: "apples", value: 9)
myHashTable.get(key: "apples")
myHashTable.set(key: "oranges", value: 2)

print(myHashTable.keys())

//: [Next](@next)
