//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/22/25.
//

import Foundation

// BOJ 2178 미로탐색
// BFS

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]; let m = input[1]
var arr: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
var check = Array.init(repeating: Array.init(repeating: false, count: m), count: n)
var dis = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for i in 0..<n {
    arr[i] = readLine()!.map { Int(String($0))! }
}


func BFS(_ x: Int, _ y: Int) -> Int {
    var queue: [(Int, Int)] = []
    queue.append((x, y))
    dis[x][y] = 1
    check[x][y] = true
    
    while !queue.isEmpty {
        let front = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = front.0 + dx[i]
            let ny = front.1 + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            if !check[nx][ny] && arr[nx][ny] == 1 {
                dis[nx][ny] = dis[front.0][front.1] + 1
                queue.append((nx, ny))
                check[nx][ny] = true
            }
        }
        
    }
    
    return dis[n - 1][m - 1]
}

print(BFS(0, 0))

