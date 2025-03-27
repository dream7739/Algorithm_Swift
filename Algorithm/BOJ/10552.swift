//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/27/25.
//

import Foundation

// 10552 DOM
// DFS
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], p = input[2]
var v = Array.init(repeating: 0, count: m + 1)
var check = Array.init(repeating: false, count: m + 1)
var answer = 0 // 몇 번 채널을 변경해야 하는지

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    
    // 가장 나이가 적은 사람이 변경한다
    if v[b] == 0 {
        v[b] = a
    }
}

func DFS(_ node: Int) {
    if !check[node] {
        check[node] = true
        if v[node] != 0 { // 0이라는 건 더 이상 연결된 노드가 없다는 것
            answer += 1   // 한번 채널을 변경
            DFS(v[node])  // 좋아하는 채널으로 노드를 변경
        }
    } else {
        answer = -1
    }
}

DFS(p)
print(answer)

