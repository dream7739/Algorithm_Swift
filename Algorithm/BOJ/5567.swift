//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/10/25.
//

import Foundation

// 5567 결혼식

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: n + 1)
var visited = Array(repeating: false, count: n + 1)
var answer = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

func DFS(_ node: Int, _ depth: Int) {
    if depth == 2 { return }

    for i in 0..<graph[node].count {
        let next = graph[node][i]
        visited[next] = true
        DFS(next, depth + 1)
    }
}

visited[1] = true
DFS(1, 0)
answer = visited.filter { $0 }.count  - 1
print(answer)
