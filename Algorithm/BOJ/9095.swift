//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/18/25.
//

import Foundation

// 9095 1,2,3 더하기

func DFS(_ sum: Int, _ target: Int) {
    if sum == target {
        answer += 1
        return
    }
    
    for i in 1...3 {
        if sum + i <= target {
            DFS(sum + i, target)
        }
    }
}

let t = Int(readLine()!)!
var answer = 0

for _ in 0..<t {
    let n = Int(readLine()!)!
    DFS(0, n)
    
    print(answer)
    answer = 0
}
