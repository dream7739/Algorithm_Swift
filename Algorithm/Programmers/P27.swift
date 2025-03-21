//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/19/25.
//

import Foundation

// 모의고사
// 1번 1, 2, 3, 4, 5 
// 2번 2, 1, 2, 3, 2, 4, 2, 5
// 3번 3, 3, 1, 1, 2, 2, 4, 4, 5, 5
func solution(_ answers:[Int]) -> [Int] {
    let p1 = [1, 2, 3, 4, 5]
    let p2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let p3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var n: [Int: Int] = [:]
    n[1] = 0
    n[2] = 0
    n[3] = 0
    
    for i in 0..<answers.count {
        n[1]! += p1[i % 5] == answers[i] ? 1 : 0
        n[2]! += p2[i % 8] == answers[i] ? 1 : 0
        n[3]! += p3[i % 10] == answers[i] ? 1 : 0
    }
    
    let max = n.values.max()!
    let answer = n.filter { $0.value == max }.keys.sorted()
    return answer
}

print(solution([1,2,3,4,5]))
print(solution([1,3,2,4,2]))
