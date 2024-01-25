//: [Previous](@previous)

import Foundation

//Google Question
//Given an array = [2,5,1,2,3,5,1,2,4]:
//It should return 2

//Given an array = [2,1,1,2,3,5,1,2,4]:
//It should return 1

//Given an array = [2,3,4,5]:
//It should return undefined


// Judy
// HashTable, Time: O(n), Space: O(n)
func firstRecurringCharacter(input: [Int]) -> Int? {
    var stored = [Int: Bool]()
    for number in input {
        if stored[number] == true {
            return number
        } else {
            stored[number] = true
        }
    }
    return nil
}

// Array, Time: O(n^2), Space: O(1)
// 當 [2,5,5,2,3,5,1,2,4] 會有問題，因為外層 loop 先發現 2 重複，但實際上是 5 先重複，解法待思考
func firstRecurringCharacter2(input: [Int]) -> Int? {
    for i in 0..<input.count {
        for j in 1..<input.count {
            if input[i] == input[j] {
                return input[i]
            }
        }
    }
    return nil
}

firstRecurringCharacter(input: [2,1,1,2,3,5,1,2,4])
firstRecurringCharacter(input: [2,3,4,5])
firstRecurringCharacter(input: [2,5,5,2,3,5,1,2,4])

//Bonus... What if we had this:
// [2,5,5,2,3,5,1,2,4]
// return 5 because the pairs are before 2,2

//: [Next](@next)
