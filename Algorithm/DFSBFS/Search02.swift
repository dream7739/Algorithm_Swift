//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 2/26/25.
//

import Foundation

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


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var graph = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
var answer = 0

for i in 0..<n {
    graph[i] = readLine()!.split(separator: "").map { Int($0)! }
}

var queue = Queue<(Int, Int)>()
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

func BFS(_ x: Int, _ y: Int) {
    queue.enqueue((x, y))

    while !queue.isEmpty {
        // 큐의 가장 앞의 원소를 찾아 방문
        guard let v = queue.dequeue() else { return }
        
        for i in 0..<4 {
            let nx = v.0 + dx[i]
            let ny = v.1 + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            if graph[nx][ny] == 1 {
                graph[nx][ny] = graph[x][y] + 1
                BFS(nx, ny)
            }
        }
        
        
    }
}

BFS(0, 0)
print(graph[n - 1][m - 1])
