//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/8/25.
//

import Foundation

// 17086 아기 상어2

let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
let dy = [-1, 0, 1, -1, 1, -1, 0, 1]
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = [[Int]]()
var answer = 0

func BFS(x: Int, y: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = [(x: Int, y: Int, dis: Int)]()
    queue.append((x, y, 0))
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<8 {
            let nx = cur.x + dx[i]
            let ny = cur.y + dy[i]
            let dis = cur.dis
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m || visited[nx][ny] {
                continue
            }
            
            if arr[nx][ny] == 1 {
                return dis + 1
            } else {
                visited[nx][ny] = true
                queue.append((nx, ny, dis + 1))
            }
        }
    }
    
    return 0
}



for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 0 {
            answer = max(answer, BFS(x: i, y: j))
        }
    }
}

print(answer)
