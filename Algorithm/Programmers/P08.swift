//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/11/25.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    let answer = String(n).reversed().map { Int(String($0))!}
    return answer
}

print(solution(12345))

