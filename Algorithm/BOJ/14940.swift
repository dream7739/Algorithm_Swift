//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/20/25.
//

import Foundation

// 14940 쉬운 최단거리

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var arr = [[Int]]()
var x = 0
var y = 0

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(input)
    
    for j in 0..<m {
        if input[j] == 2 {
            x = i
            y = j
            break
        }
    }
}

var answer = Array.init(repeating: Array.init(repeating: -1, count: m), count: n)
var visited = Array.init(repeating: Array.init(repeating: false, count: m), count: n)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var queue = [(Int, Int)]()
queue.append((x, y))
visited[x][y] = true
answer[x][y] = 0

func BFS() {
    while !queue.isEmpty {
        let peek = queue.removeFirst()
        for i in 0..<4 {
            let x = peek.0
            let y = peek.1
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m || visited[nx][ny] || arr[nx][ny] == 0 {
                continue
            }
            
            visited[nx][ny] = true
            answer[nx][ny] = answer[x][y] + 1
            queue.append((nx, ny))
        }
    }
    
}

BFS()

// 갈 수 없는 땅
for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 0 {
            answer[i][j] = 0
        }
    }
    print(answer[i].map { String($0) }.joined(separator: " "))
}

