//: [Previous](@previous)

import Foundation

func mergeSortedArray(arr1: [Int], arr2: [Int]) -> [Int] {
    var result = [Int]()
    result = (arr1 + arr2).sorted()

    return result
}

print(mergeSortedArray(arr1: [0, 3, 4, 31], arr2: [4, 6, 30]))

//: [Next](@next)
