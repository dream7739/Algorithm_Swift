//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/1/25.
//

import Foundation

// 2559 수열
// 온도 배열, 연속적인 며칠 동안의 온도의 합이 가장 큰 값
// 슬라이딩 윈도우

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var arr = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0

for i in 0..<m {
    sum += arr[i]
}

var answer = sum

for i in m..<n {
    sum = sum - arr[i - m] + arr[i]
    if sum > answer {
        answer = sum
    }
}

print(answer)
