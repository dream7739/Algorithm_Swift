//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 2/27/25.
//

import Foundation

// 180p 성적이 낮은 순서로 학생 출력하기

let n = Int(readLine()!)!
var arr: [(String, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    arr.append((input[0], Int(input[1])!))
}

arr.sort { $0.1 < $1.1 }
print(arr.map { $0.0 }.joined(separator: " "))
