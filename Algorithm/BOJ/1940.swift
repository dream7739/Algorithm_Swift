//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 5/4/25.
//

import Foundation

// 1940 주몽
// 투포인터

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort()

// 반대방향으로 진행하도록 포인터 설정
var p1 = 0
var p2 = arr.count - 1

var answer = 0

// p1은 증가, p2는 감소하도록 방향을 설정
// p1 == p2 포인터가 겹치면 더 이상 비교할 필요 없음
while p1 < p2 {
    let sum = arr[p1] + arr[p2]
    
    if sum < m {
        p1 += 1
    } else if sum == m {
        answer += 1
        p1 += 1
        p2 -= 1
    } else {
        p2 -= 1
    }
}

print(answer)
