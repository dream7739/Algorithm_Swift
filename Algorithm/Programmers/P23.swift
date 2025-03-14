//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/14/25.
//

import Foundation

// 점프와 순간 이동

func solution(_ n:Int) -> Int
{
    var n = n
    var ans = 0
    
    while n != 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            ans += 1
            n -= 1
        }
    }

    return ans
}

print(solution(5))
print(solution(6))
print(solution(5000))
