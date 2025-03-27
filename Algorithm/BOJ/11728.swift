//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/27/25.
//

import Foundation

// 11728 배열 합치기
// 투포인터
let input = readLine()!.split(separator: " ").map { Int($0)! }
let na = input[0], nb = input[1]
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let b = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var s1 = 0
var s2 = 0
var answer = [Int]()

while s1 < na && s2 < nb {
    if a[s1] <= b[s2] {
        answer.append(a[s1])
        s1 += 1
    } else {
        answer.append(b[s2])
        s2 += 1
    }
}

if s1 < na {
    answer += a[s1..<na]
} else if s2 < nb {
    answer += b[s2..<nb]
}

print(answer.map(String.init).joined(separator: " "))
