//
//  DFS01.swift
//  Algorithm
//
//  Created by 홍정민 on 2/26/25.
//

import Foundation

// 음료수 얼려먹기
// N * M

struct Stack<T> {
    private var array: [T] = []

    var peek: T? {
        return array.last
    }

    var isEmpty: Bool {
        return array.isEmpty
    }

    var count: Int {
        return array.count
    }

    mutating func push(_ element: T) {
        array.append(element)
    }

    mutating func pop() -> T? {
        return array.popLast()
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var graph: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)

for i in 0..<n {
    graph[i] = readLine()!.split(separator: "").map { Int($0)! }
}

@discardableResult
func DFS(_ x: Int, _ y: Int) -> Bool {
    // 경계를 벗어남
    if x <= -1 || y <= -1 || x >= n || y >= m { return false }
    
    // 방문하지 않았다면 방문.
    // 해당위치에서 얼음을 만들 수 있음
    if graph[x][y] == 0 {
        graph[x][y] = 1
        DFS(x - 1, y)
        DFS(x, y - 1)
        DFS(x + 1, y)
        DFS(x, y + 1)
        return true
    }
    return false
}

var answer = 0

for i in 0..<n {
    for j in 0..<m {
        if DFS(i, j) {
            answer += 1
        }
    }
}

print(answer)
