//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/6/25.
//

import Foundation

// 3986 좋은 단어

let n = Int(readLine()!)!
var arr = [String]()
var stack = [Character]()
var answer = 0

for _ in 0..<n {
    arr.append(readLine()!)
}

for word in arr {
    for char in word {
        if let last = stack.last, last == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    if stack.isEmpty {
        answer += 1
    }
    stack.removeAll()
}

print(answer)
