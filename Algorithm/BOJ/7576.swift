//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/24/25.
//

import Foundation

// 7576 토마토
let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]
var arr = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
var dis = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var queue: [(x: Int, y: Int)] = []
var idx = 0
var answer = 0
var lastIdx = (0, 0)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

// 시작점이 여러개일 수 있다.
for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 1 {
            queue.append((i, j))
        }
    }
}

while idx < queue.count {
    let front = queue[idx]
    idx += 1
    
    for i in 0..<4 {
        let nx = front.x + dx[i]
        let ny = front.y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
        
        if arr[nx][ny] == 0 {
            queue.append((nx, ny))
            arr[nx][ny] = 1
            dis[nx][ny] = dis[front.x][front.y] + 1
            lastIdx = (nx, ny)
        }
    }
}

answer = dis[lastIdx.0][lastIdx.1]

for num in arr {
    if num.contains(0) {
        answer = -1
    }
}

print(answer)
