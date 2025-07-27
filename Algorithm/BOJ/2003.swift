//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/27/25.
//

import Foundation

// 2003 수들의 합2
// i번째 수부터 j번째 수까지가 M이 되는 경우의 수
// N이 10^4
// 수열의 길이에는 제한이 없음

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

var start = 0
var end = 0
var sum = 0

while start < n {
    if sum >= m {
        if sum == m {
            answer += 1
        }
        sum -= arr[start]
        start += 1
    } else {
        if end == n { break }
        sum += arr[end]
        end += 1
    }
}

print(answer)

