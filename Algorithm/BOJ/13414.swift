//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/28/25.
//

import Foundation

// 13414 수강신청

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (k, n) = (input[0], input[1])

var arr = [String: Int]()
var seq = 1

for _ in 0..<n {
    let num = readLine()!
    arr[num] = seq
    seq += 1
}

let answer = arr.sorted { $0.value < $1.value }.map { $0.key }.prefix(k)
for num in answer {
    print(num)
}
