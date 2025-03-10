//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/10/25.
//

import Foundation

// p.220 개미전사

let input = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var d = Array.init(repeating: 0, count: input)
d[0] = arr[0]; d[1] = max(arr[0], arr[1])

for i in 2..<input {
    d[i] = max(d[i - 1], d[i - 2] + arr[i])
}

print(d[input - 1])
