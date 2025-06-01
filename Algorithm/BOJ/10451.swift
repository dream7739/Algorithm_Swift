//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/1/25.
//

import Foundation

// 10451 순열 사이클
func DFS(_ n: Int, _ arr: [Int], _ visited: inout [Bool]) {
    visited[n] = true
    let next = arr[n]
    if !visited[next] {
        DFS(next, arr, &visited)
    }
}

let cnt = Int(readLine()!)! // 총 입력 수
var result = Array.init(repeating: 0, count: cnt) // 정답을 담을 배열

for i in 0..<cnt {
    let n = Int(readLine()!)! // 총 원소 개수
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let arr = [0] + input // 1번부터 시작되도록 구성
    var visited = Array.init(repeating: false, count: n + 1)
    var answer = 0
    
    for i in 1...n {
        if !visited[i] {
            DFS(i, arr, &visited)
            answer += 1
        }
    }
    
    result[i] = answer
}

for n in result {
    print(n)
}
