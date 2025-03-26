//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/26/25.
//

import Foundation

// 14916 거스름돈
var input = Int(readLine()!)!
var answer = 0

while input > 0 {
    // 5로 나누어진다면 갯수 세기
    if input % 5 == 0 {
        let num = input / 5
        answer += num
        input = 0
    } else {
        // 5로 나누어지지 않는다면 -2씩하면서 카운팅
        input -= 2
        answer += 1
    }
}

input == 0 ? print(answer) : print(-1)
