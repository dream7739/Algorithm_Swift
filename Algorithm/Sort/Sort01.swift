//
//  Sort01.swift
//  Algorithm
//
//  Created by 홍정민 on 2/27/25.
//

import Foundation

// 178p. 위에서 아래로
let n = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

print(arr.sorted { $0 > $1 }.map { String($0) }.joined(separator: " "))
