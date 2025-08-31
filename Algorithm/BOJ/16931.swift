//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/30/25.
//

import Foundation


// 16931 겉넓이 구하기

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
var answer = 0
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

answer += n * m * 2

for i in 0..<n {
    for j in 0..<m {
        for k in 0..<4 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m {
                answer += arr[i][j]
                continue
            }
            
            if arr[i][j] > arr[nx][ny] {
                answer += (arr[i][j] - arr[nx][ny])
            }
        }
    }
}

print(answer)
