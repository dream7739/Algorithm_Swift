//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/11/25.
//

import Foundation

// 1158 요세푸스 문제
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1] - 1
var arr = [Int](1...n)
var current = 0
var answer: [Int] = []

while !arr.isEmpty {
    // 카운트를 넘지 않게 하기 위해 arr.count로 나눈다
    current = (current + k) % arr.count
    answer.append(arr.remove(at: current))
}

print("<\(answer.map { String($0) }.joined(separator: ", "))>")
