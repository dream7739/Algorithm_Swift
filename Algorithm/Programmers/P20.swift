//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/13/25.
//

import Foundation

// 멀리뛰기
func solution(_ n:Int) -> Int {
    var dp: [Int] = Array(repeating: 0, count: 2001)
    dp[1] = 1
    dp[2] = 2
    
    for i in 1...n {
        if i == 1 || i == 2 {
            dp[i] = i
        } else {
            dp[i] = (dp[i - 2] + dp[i - 1]) % 1234567
        }
    }
    
    return dp[n]
}

print(solution(4))
print(solution(3))
