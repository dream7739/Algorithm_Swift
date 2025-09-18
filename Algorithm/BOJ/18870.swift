//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/18/25.
//

import Foundation

// 18870 좌표 압축

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var map = [Int: Int]()

let temp = Array(Set(arr)).sorted()

for (idx, num) in temp.enumerated() {
    map[num] = idx
}

var answer = [Int]()
for num in arr {
    answer.append(map[num]!)
}

print(answer.map { String($0) }.joined(separator: " "))

