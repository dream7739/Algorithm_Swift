//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/7/25.
//

import Foundation

// p.217 1로 만들기

let input = Int(readLine()!)!
var arr = Array.init(repeating: 0, count: 30001)

for i in 2...input {
    arr[i] = arr[i - 1] + 1
    
    if i % 2 == 0 {
        arr[i] = min(arr[i], arr[i / 2] + 1) // 함수호출 횟수 + 1
    }
    
    if i % 3 == 0 {
        arr[i] = min(arr[i], arr[i / 3] + 1)
    }
    
    if i % 5 == 0 {
        arr[i] = min(arr[i], arr[i / 5] + 1)
    }
}

print(arr[input])
