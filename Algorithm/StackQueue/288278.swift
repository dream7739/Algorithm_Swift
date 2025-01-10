//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/10/25.
//

// 288278 스택 2
import Foundation

struct Stack<T> {
    var elements: [T] = []

    var peek: T? {
        return elements.last
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        elements.popLast()
    }
    
}

let input = Int(readLine()!)!
var stack = Stack<Int>()

for _ in 0..<input {
    let command = readLine()!.split(separator: " ").map { Int($0)! }
    let number = command[0]
    
    switch number {
    case 1:
        stack.push(command[1])
    case 2:
        print(stack.pop() ?? -1)
    case 3:
        print(stack.count)
    case 4:
        print(stack.isEmpty ? 1 : 0)
    case 5:
        print(stack.peek ?? -1)
    default:
        fatalError()
    }
    
}
