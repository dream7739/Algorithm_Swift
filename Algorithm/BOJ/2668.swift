//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/15/25.
//

import Foundation

// 2668 숫자 고르기
let n = Int(readLine()!)!
var arr = [0]
var answer = Set<Int>()
var chk = Array(repeating: false, count: n + 1)

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

func DFS(_ start: Int, _ cur: Int, _ path: inout [Int], _ visited: inout [Bool]) -> Bool {
    let next = arr[cur]

    if visited[next] {
        return next == start
    }

    visited[next] = true
    path.append(next)

    return DFS(start, next, &path, &visited)
}

for i in 1...n {
    if !chk[i] {
        var path = [i]
        var visited = Array(repeating: false, count: n + 1)
        visited[i] = true

        if DFS(i, i, &path, &visited) {
            for j in path {
                answer.insert(j)
                chk[j] = true
            }
        }
    }
}

let result = answer.sorted()
print(result.count)
for num in result {
    print(num)
}
