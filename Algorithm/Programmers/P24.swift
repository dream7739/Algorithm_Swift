//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/14/25.
//

import Foundation

// N개의 최소공배수
func lcd(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}

func solution(_ arr:[Int]) -> Int {
    var prev = arr[0]
    
    for i in 1..<arr.count {
        prev = lcd(prev, arr[i])
    }
    
    return prev
}

print(solution([2, 6, 8, 14]))
