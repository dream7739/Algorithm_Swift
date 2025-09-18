//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/18/25.
//

import Foundation

// 1920 수 찾기
// N <= 100,000
// O(N^2) = (10^5)^2 = 10^10 = 100억
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var set = Set(arr)
let m = Int(readLine()!)!
var tmp = readLine()!.split(separator: " ").map { Int($0)! }

for comp in tmp {
    if set.contains(comp) {
        print(1)
    } else {
        print(0)
    }
}
