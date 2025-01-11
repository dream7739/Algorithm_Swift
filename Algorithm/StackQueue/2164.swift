//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/11/25.
//

import Foundation

// 2164 카드2
let input = Int(readLine()!)!
var arr: [Int] = []
var front = 0

for i in 1...input {
    arr.append(i)
}

while arr.count - front > 1 {
    front += 1
    arr.append(arr[front])
    front += 1
}

print(arr.last!)
