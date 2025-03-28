//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/28/25.
//

import Foundation

// 11403 경로찾기
// arr[i][j] == 1 이라는 것은 i에서 j로 가는 경로가 존재한다는 것을 의미

// 정점의 개수
let n = Int(readLine()!)!
var arr = [[Int]]()
var answer = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
var visited = Array.init(repeating: false, count: n)

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

//시작점, 현재 방문지점
func DFS(_ start: Int, _ now: Int) {
    for i in 0..<n {
        if !visited[i] && arr[now][i] == 1 {
            answer[start][i] = 1
            visited[i] = true
            DFS(start, i) // 0 > 1 > 2라면 0 > 2도 가능하다.
        }
    }
}

for i in 0..<n {
    DFS(i, i)
    visited = Array.init(repeating: false, count: n)
}

for i in answer {
    for num in i {
        print(num, terminator: " ")
    }
    print()
}

