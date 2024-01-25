import UIKit

func reverse(str: String) -> String {
    var reversed = [Character]()
    let array = Array(str)
    
    for i in stride(from: array.count - 1, through: 0, by: -1) {
        reversed.append(array[i])
    }
    
    return String(reversed)
}

print(reverse(str: "Hello I'm Judy!"))

func reverse2(str: String) -> String {
    var reversed = ""
    for char in str {
        reversed = char.description + reversed
    }
    return reversed
}

print(reverse2(str: "Hello I'm Judy!"))

func reverse3(str: String) -> String {
    let reversed = str.reversed()
    return String(reversed)
}

print(reverse3(str: "Hello I'm Judy!"))
