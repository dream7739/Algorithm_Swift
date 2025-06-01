//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/1/25.
//

import Foundation

// 21921 블로그
// 슬라이딩 윈도우
// 기간이 정해져있기 때문에 원래 구간의 크기를 유지하면서 합을 구함

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 총운영기간
let x = input[1] // X일동안
let visits = readLine()!.split(separator: " ").map { Int($0)! }

var sum = 0
for i in 0..<x {
    sum += visits[i]
}

var answer = sum
var count = 1

for i in x..<n {
    sum = sum - visits[i - x] + visits[i]
    if sum > answer {
        answer = sum
        count = 1
    } else if sum == answer {
        count += 1
    }
}

if answer == 0 {
    print("SAD")
} else {
    print(answer)
    print(count)
}
