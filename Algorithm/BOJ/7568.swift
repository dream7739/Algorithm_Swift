//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/15/25.
//

import Foundation

// 7568 덩치
let n = Int(readLine()!)!

var arr = [(w: Int, h: Int)]()
var answer = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

for num in arr {
    let grade = arr.filter { num.w < $0.w && num.h < $0.h }.count + 1
    answer.append(grade)
}

print(answer.map { String($0) }.joined(separator: " "))
