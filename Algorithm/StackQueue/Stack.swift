//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/9/25.
//

import Foundation

// 스택
// 후입선출 LIFO
// 삽입, 삭제, 최상단 조회 = O(1)
// removeLast: 마지막 값이 무조건 존재
// popLast: 마지막 값이 없다면 nil을 리턴
struct Stack<T> {
    private var elements: [T] = []
    
    // 최상단
    var peek: T? {
        return elements.last
    }
    
    // 비어있는지 유무
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // 원소 개수
    var count: Int {
        return elements.count
    }
    
    // push
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // pop
    mutating func pop() -> T? {
        return elements.popLast()
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

print(stack.pop())

