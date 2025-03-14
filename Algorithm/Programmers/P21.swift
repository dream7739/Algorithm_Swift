//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/14/25.
//

import Foundation

// 최솟값 만들기
func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let A = A.sorted()
    let B = B.sorted(by: >)
    var ans = 0
    
    for i in 0..<A.count {
        ans += A[i] * B[i]
    }
    
    return ans
}

print(solution([1, 4, 2], [5, 4, 4]))
print(solution([1, 2], [3, 4]))
