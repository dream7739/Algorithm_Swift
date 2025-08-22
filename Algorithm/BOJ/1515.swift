//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/20/25.
//

import Foundation

// 1515 수 이어쓰기

let input = Array(readLine()!)
var answer = 0
var idx = 0
var num = 1

while idx < input.count {
    let str = String(num)
    
    for ch in str {
        if idx < input.count && input[idx] == ch {
            idx += 1
        }
    }
    
    num += 1
}

print(num - 1)
