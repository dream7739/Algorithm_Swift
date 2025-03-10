//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/10/25.
//

import Foundation

// p.223 바닥공사
// 2 * N 타일링

// d[i - 1] 무조건 2 x 1로 고정됨
// d[i - 2] 2 x 2로 채우는 방법,  1 x 2 로 채우는 방법 2가지

let input = Int(readLine()!)!
var d = Array.init(repeating: 0, count: input + 1)
d[1] = 1; d[2] = 3

for i in 3...input {
    d[i] = (d[i - 1] + d[i - 2] * 2) % 796796
}

print(d[input])
