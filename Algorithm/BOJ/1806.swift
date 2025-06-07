//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/7/25.
//

import Foundation

// 1806 부분합
// 부분합이 S 이상이 되는 것 중 가장 짧은 것의 길이
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var answer = Int.max
var sum = 0
var left = 0

for right in 0..<n {
    sum += arr[right]
    
    while sum >= s {
        answer = min(answer, right - left + 1)
        sum -= arr[left]
        left += 1
    }
    
}

print(answer == Int.max ? 0 : answer)
