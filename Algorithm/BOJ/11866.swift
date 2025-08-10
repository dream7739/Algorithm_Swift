//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/10/25.
//

import Foundation

// 11866 요세푸스 문제 0
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

var queue = Array(1...n)
var answer = [Int]()
var index = 0

while !queue.isEmpty {
    for _ in 0..<k - 1 {
        let front = queue.removeFirst()
        queue.append(front)
    }
    let removed = queue.removeFirst()
    answer.append(removed)
}

print("<" + answer.map{ String($0) }.joined(separator: ", ") + ">")
