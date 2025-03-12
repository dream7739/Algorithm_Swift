//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/12/25.
//

import Foundation

// 정수 제곱근 판별

func solution(_ n:Int64) -> Int64 {
    let t = Int64(sqrt(Double(n)))
    return t * t == n ? (t + 1) * (t + 1) : -1
}

print(solution(121))
print(solution(3))
