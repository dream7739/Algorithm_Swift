//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/18/25.
//

import Foundation

// 10773 제로
let n = Int(readLine()!)!
var elements = [Int]()

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    if input == 0 {
        elements.removeLast()
    } else {
        elements.append(input)
    }
}

print(elements.reduce(0, +))
