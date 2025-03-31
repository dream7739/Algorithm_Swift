//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/31/25.
//

import Foundation

// 2667 단지번호 붙이기

let n = Int(readLine()!)!
var arr = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
var check = Array.init(repeating: Array.init(repeating: false, count: n), count: n)
var answer = [Int]()

for i in 0..<n {
    arr[i] = readLine()!.map { Int(String($0))! }
}

var cnt = 0
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func DFS(_ x: Int, _ y: Int) {
    cnt += 1
    check[x][y] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= n || ny >= n { continue }
        if check[nx][ny] || arr[nx][ny] == 0 { continue }
        
        DFS(nx, ny)
    }
    
}

for i in 0..<n {
    for j in 0..<n {
        if check[i][j] || arr[i][j] == 0 { continue }
        DFS(i, j)
        answer.append(cnt)
        cnt = 0
    }
}

print(answer.count)
answer.sort()
for num in answer {
    print(num)
}
