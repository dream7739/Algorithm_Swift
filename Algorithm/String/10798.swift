//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 4/26/25.
//

import Foundation

// 10798 세로읽기

var arr: [[String]] = []
var answer = ""

for _ in 0..<5 {
    let str = readLine()!.map { String($0) }
    arr.append(str)
}

let maxLen = arr.map { $0.count }.max()!

for i in 0..<maxLen {
    for j in 0..<5 {
        let len = arr[j].count
        if i >= len { continue }
        
        answer += arr[j][i]
    }
}

print(answer)
