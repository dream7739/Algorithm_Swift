//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/1/25.
//

import Foundation

// 2628 종이자르기

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 가로 길이
let m = input[1] // 세로 길이

let cnt = Int(readLine()!)!

var vc = [0, m] // 수직 커팅
var hc = [0, n] // 수평 커팅

for _ in 0..<cnt {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let c = input[0]
    let l = input[1]
    
    if c == 0 {
        vc.append(l)
    } else if c == 1 {
        hc.append(l)
    }
}

vc.sort() // [0, 2, 3, 8]
hc.sort() // [0, 4, 10]

var answer = 0

for i in 0..<vc.count - 1 {
    for j in 0..<hc.count - 1 {
        let h = vc[i + 1] - vc[i]
        let w = hc[j + 1] - hc[j]
        answer = max(answer, h * w)
    }
}

print(answer)
