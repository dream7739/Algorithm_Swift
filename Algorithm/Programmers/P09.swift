//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/12/25.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum = 0
    for i in ( a < b ? a...b : b...a) {
        sum += i
    }
    return Int64(sum)
}

print(solution(3, 5))
print(solution(3, 3))
print(solution(5, 3))
