//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/13/25.
//

import Foundation

// 최댓값과 최솟값

func solution(_ s:String) -> String {
    let arr = s.split(separator: " ").map { Int($0)! }
    let n = arr.min()!
    let m = arr.max()! 
    
    return "\(n) \(m)"
}

print(solution("1 2 3 4"))
print(solution("-1 -2 -3 -4"))
print(solution("-1 -1"))

