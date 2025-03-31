//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/31/25.
//

import Foundation

// 7562 나이트의 이동
// 나이트가 움직여서 해당 칸으로 최소 몇 번 만에 이동할 수 있을지?

let input = Int(readLine()!)!
var n = 0
let dx = [-1, -2, -2, -1, 1, 2, 2, 1]
let dy = [-2, -1, 1, 2, -2, -1, 1, 2]

var answer = [Int]()

func BFS(_ cur: [Int], _ next: [Int]) -> Int {
    var check = Array.init(repeating: Array.init(repeating: false, count: n), count: n)
    var dis = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
    
    // 현재 좌표
    let x = cur[0], y = cur[1]
    
    // 도착 좌표
    let nx = next[0], ny = next[1]
    
    var queue = [(Int, Int)]()
    queue.append((x, y))
    check[x][y] = true

    while !queue.isEmpty {
        let front = queue.removeFirst()
        
        if front.0 == nx && front.1 == ny { break }
        
        for i in 0..<8 {
            let nx = front.0 + dx[i]
            let ny = front.1 + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
            if !check[nx][ny] {
                check[nx][ny] = true
                dis[nx][ny] = dis[front.0][front.1] + 1
                queue.append((nx, ny))
            }
        }
    }
    
    return dis[nx][ny]
}

for _ in 0..<input {
    n = Int(readLine()!)!
    let cur = readLine()!.split(separator: " ").map { Int($0)! }
    let next = readLine()!.split(separator: " ").map { Int($0)! }
    
    let num = BFS(cur, next)
    answer.append(num)
}

// 답 출력
for num in answer {
    print(num)
}
