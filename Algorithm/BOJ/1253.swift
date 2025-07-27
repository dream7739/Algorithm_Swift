//
//  1253.swift
//  Algorithm
//
//  Created by 홍정민 on 7/27/25.
//

import Foundation

// 1253 좋다
// 어떤 수 = A + B(서로 다른 수) = 좋다
// 좋은 수의 개수 구하기
// 완전탐색 O(N^3) = 10^9 불가능

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var answer = 0

for i in 0..<n {
    let target = arr[i]

    var start = 0
    var end = n - 1
    
    while start < end {
        let sum = arr[start] + arr[end]
        if sum == target {
            if start != i && end != i {
                answer += 1
                break
            } else if start == i {
                start += 1
            } else if end == i {
                end -= 1
            }
        } else if sum < target {
            start += 1
        } else {
            end -= 1
        }
    }
}

print(answer)
