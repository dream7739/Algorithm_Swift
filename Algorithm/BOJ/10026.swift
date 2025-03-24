//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/24/25.
//

import Foundation

// 10026 적록색약
// 적록색약이 보았을 때의 구역 개수
// 적록색약이 아닌 사람이 보았을 때의 구역 개수

let n = Int(readLine()!)!
var arr = Array.init(repeating: Array.init(repeating: "", count: n), count: n)
var check = Array.init(repeating: Array.init(repeating: false, count: n), count: n)

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for i in 0..<n {
    arr[i] = readLine()!.map { String($0) }
}

var a = 0
var b = 0

// 적록색약이 아닌 경우
for i in 0..<n {
    for j in 0..<n {
        if !check[i][j] {
            BFS(i, j, false)
            a += 1
        }
    }
}

check = Array.init(repeating: Array.init(repeating: false, count: n), count: n)

// 적록색약인 경우
for i in 0..<n {
    for j in 0..<n {
        if !check[i][j] {
            BFS(i, j, true)
            b += 1
        }
    }
}

print(a, b)

// t가 true이면 적녹색약O
// t가 false이면 적녹색약X
func BFS(_ x: Int, _ y: Int, _ isWeak: Bool) {
    var queue: [(x: Int, y: Int)] = []
    let color = arr[x][y]
    queue.append((x, y))
    check[x][y] = true
    
    while !queue.isEmpty {
        let front = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = front.x + dx[i]
            let ny = front.y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
            if check[nx][ny] { continue }
            
            // 색맹인 경우에는 RG && B
            // 색맹이 아닌 경우에는 R & G & B
            if isWeak {
                if (color == "R" || color == "G") && (arr[nx][ny] == "R" || arr[nx][ny] == "G") {
                    check[nx][ny] = true
                    queue.append((nx, ny))
                } else if color == arr[nx][ny] {
                    check[nx][ny] = true
                    queue.append((nx, ny))
                }
            } else if color == arr[nx][ny] {
                check[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
}
