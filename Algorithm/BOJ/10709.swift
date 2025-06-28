//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/28/25.
//

import Foundation

// 10709 기상캐스터

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (input[0], input[1])
var arr = [[String]]()
var answer = Array.init(repeating: Array.init(repeating: 0, count: w), count: h)

for _ in 0..<h {
    let input = readLine()!.map { String($0) }
    arr.append(input)
}

for i in 0..<h {
    var idx = -1
    
    for j in 0..<w {
        if arr[i][j] == "c" {
            answer[i][j] = 0
            idx = j
        } else if arr[i][j] == "." {
            if idx == -1 {
                answer[i][j] = -1
            } else {
                answer[i][j] = j - idx
            }
        }
    }
}

for i in 0..<h {
    print(answer[i].map { String($0) }.joined(separator: " "))
}
