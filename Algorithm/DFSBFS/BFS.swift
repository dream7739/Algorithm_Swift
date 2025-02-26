//
//  BFS.swift
//  Algorithm
//
//  Created by 홍정민 on 2/26/25.
//

import Foundation

// BFS (너비 우선 탐색)

var graph = [
    [],
    [2, 3, 8], // 1-2-3-8 연결
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

// 9 * 9
var visited = Array.init(
    repeating: false,
    count: 9
)

var queue = Queue<Int>()

struct Queue<T> {
    var array: [T] = []
    var front = 0
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    var peek: T? {
        return array.last
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        defer { front += 1 }
        guard front < count else { return nil }
        return array[front]
    }
}

func BFS(graph: [[Int]], v: Int, visited: inout [Bool]) {
    queue.enqueue(v)
    visited[v] = true
    
    while !queue.isEmpty {
        guard let v = queue.dequeue() else { return }
        print(v)
        
        for i in graph[v] {
            if !visited[i] {
                queue.enqueue(i)
                visited[i] = true
            }
        }
    }
    
}

BFS(graph: graph, v: 1, visited: &visited)

