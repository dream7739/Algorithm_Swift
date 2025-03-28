//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/28/25.
//

import Foundation

// 14467 소가 길을 건너간 이유1

let input = Int(readLine()!)!
var cow = Array.init(repeating: -1, count: input + 1)
var answer = 0

for _ in 0..<input {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    let cur = cow[a]
    
    if cur != -1 && cur != b {
        answer += 1
    }
    
    cow[a] = b
}

print(answer)





