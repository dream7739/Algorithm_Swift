//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/12/25.
//

import Foundation

// 정수 내림차순으로 배치하기
func solution(_ n:Int64) -> Int64 {
    let s = String(String(n).sorted { $0 > $1 })
    return Int64(s)!
}

print(solution(118372))
