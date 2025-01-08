//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/8/25.
//

import Foundation
// 구현 예제 4-3
// 왕실의 나이트
// 나이트는 두 가지 경우로 이동 가능
// 1. 수평 2칸 이동, 수직 1칸 이동
// 2. 수직 2칸 이동, 수평 1칸 이동
// a1 이동 경우의 수 = 2
// 1. (-1 , -2), (1, -2), (-1, 2), (1, 2)
// 2. (-2, -1), (-2, 1), (2, -1), (2, 1)

// a1을 1, 1이라고 했을 때 2가지 가능
// 유효범위 (1, 1) ~ (8, 8)
// 1. (0, -1), (2, -1), (0, 3), (2, 3)
// 2. (-1, 0), (-1, 2), (1, 0), (3, 2)

// 범위를 벗어나지 않는 이동 경우의 수 구하기

//print(Character("a").asciiValue)

let input = readLine()!.split(separator: "")
var x = Int(Character(String(input[0])).asciiValue! - 96)
var y = Int(input[1])!
var options = [(-1, -2), (1, -2), (-1, 2), (1, 2), (-2, -1), (-2, 1), (2, -1), (2, 1)]
var answer = 0

for option in options {
    let dx = x + option.0
    let dy = y + option.1
    
    if dx < 1 || dy < 1 || dx > 8 || dy > 8 {
        continue
    } else {
        answer += 1
    }
}

print(answer)
