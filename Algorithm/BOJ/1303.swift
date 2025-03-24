//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/24/25.
//

import Foundation

// 1303 전쟁
// BFS
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[1], m = input[0]
var w = 0, b = 0
var arr = [[String]]()
var check = Array.init(repeating: Array.init(repeating: false, count: m), count: n)
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for _ in 0..<n {
    arr.append(readLine()!.map { String($0) })
}

func BFS(_ x: Int, _ y: Int) -> Int {
    var answer = 0
    let color = arr[x][y]
    var queue: [(Int, Int)] = []
    queue.append((x, y))
    check[x][y] = true
    
    while !queue.isEmpty {
        let front = queue.removeFirst()
        answer += 1
        
        for i in 0..<4 {
            let nx = front.0 + dx[i]
            let ny = front.1 + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            if !check[nx][ny] && arr[nx][ny] == color {
                check[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    return answer * answer
}

for i in 0..<n {
    for j in 0..<m {
        if check[i][j] { continue }
        
        if arr[i][j] == "W" {
            w +=  BFS(i, j)
        } else if arr[i][j] == "B" {
            b += BFS(i, j)
        }
    }
}

print(w, b)
