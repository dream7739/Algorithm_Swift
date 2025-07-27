//
//  10431.swift
//  Algorithm
//
//  Created by 홍정민 on 7/27/25.
//

import Foundation

// 10431 줄세우기

let n = Int(readLine()!)!
var arr = [[Int]]()

func calculateStep(heights: inout [Int]) -> Int {
    var step = 0
    for i in 1..<heights.count {
        for j in stride(from: i, to: 0, by: -1) {
            if heights[j] < heights[j - 1] {
                heights.swapAt(j, j - 1)
                step += 1
            }
        }
    }
    return step
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let numbers = Array(input.dropFirst())
    arr.append(numbers)
}

for i in 0..<arr.count {
    let step = calculateStep(heights: &arr[i])
    print(i + 1, step)
}
