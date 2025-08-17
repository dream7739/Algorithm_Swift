//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/17/25.
//

import Foundation

// 1764 듣보잡
// 듣도 못한 사람 수 N, 보도 못한 사람 수 M

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = Set<String>()
var answer = [String]()

for _ in 0..<n {
    let str = readLine()!
    arr.insert(str)
}

for _ in 0..<m {
    let str = readLine()!
    
    if arr.contains(str) {
        answer.append(str)
    }
}

answer.sort()

print(answer.count)
for str in answer {
    print(str)
}
