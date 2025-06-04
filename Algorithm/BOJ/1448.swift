//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/4/25.
//

import Foundation

// 1448 삼각형 만들기
// 삼각형을 만들 수 있는 조건: 가장 긴 변의 길이 < 두 변의 길이의 합

let input = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<input {
    let n = Int(readLine()!)!
    arr.append(n)
}

arr.sort { $0 > $1 }
var answer = -1

for i in 2..<arr.count {
    let a = arr[i]
    let b = arr[i - 1]
    let c = arr[i - 2]
    
    if c < a + b {
        answer = a + b + c
        break
    }
}

print(answer)
