//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/6/25.
//

import Foundation

// 2107 포함하는 구간
// N <= 25000, 2.5 * 10^3

let n = Int(readLine()!)!
var interval = [(Int, Int)]()
var answer = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let (start, end) = (Int(input[0])!, Int(input[1])!)
    interval.append((start, end))
}

for comp in interval {
    let cnt = interval.filter { $0.0 > comp.0 && $0.1 < comp.1 }.count
    answer = max(answer, cnt)
}

print(answer)
