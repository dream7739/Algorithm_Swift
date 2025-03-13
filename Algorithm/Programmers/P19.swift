//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/13/25.
//

import Foundation

// 다음 큰 숫자
func solution(_ n:Int) -> Int
{
    var answer = n
    
    while true {
        answer += 1
        
        if n.nonzeroBitCount == answer.nonzeroBitCount {
            break
        }
    }
    return answer
}

print(solution(78))
print(solution(15))
