//
//  22945.swift
//  Algorithm
//
//  Created by 홍정민 on 7/19/25.
//

import Foundation

// 22945 팀빌딩
// A와 B 사이 존재 다른 개발자 수 * min(A, B)
// 팀 빌딩에서 나올 수 있는 팀 능력치 최대값

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var p1 = 0
var p2 = n - 1
var answer = Int.min

while p1 < p2 {
    let value = min(arr[p1], arr[p2]) * (p2 - p1 - 1)
    answer = max(answer, value)
    
    // 작은 능력치를 가진 포인터의 이동
    if arr[p1] < arr[p2] {
        p1 += 1
    } else {
        p2 -= 1
    }
}

print(answer)
