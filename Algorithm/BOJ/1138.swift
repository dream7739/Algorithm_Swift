//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/6/25.
//

import Foundation

// 1138 한 줄로 서기

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

var result = Array(repeating: 0, count: n)

for i in 0..<n {
    let height = i + 1
    let left = input[i]
    var count = 0

    for j in 0..<n {
        if result[j] == 0 {
            if count == left {
                result[j] = height
                break
            }
            count += 1
        }
    }
}

print(result.map { String($0) }.joined(separator: " "))
