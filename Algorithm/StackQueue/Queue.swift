//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/10/25.
//

import Foundation

// 큐
// 선입선출. FIFO
// 0. 그냥 배열: 삭제 연산이 O(N)
// 1. 배열 + 포인터: 삭제 연산 O(1)이지만 공간 활용에 있어 문제
// 2. 원형큐: 크기 고정되어있는 문제(링크드리스트로 해결 가능). 죽는 공간의 활용
struct Queue<T> {
    private var front = 0
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    var peek: T? {
        return elements.last
    }
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    // O(N)
    // 맨 앞의 원소를 빼내면 모든 원소를 앞으로 당겨주는 작업이 필요
    mutating func dequeue() -> T? {
//        elements.removeFirst()
        defer { front += 1 }
        guard front < count else { return nil }
        return elements[front]
    }
}

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
