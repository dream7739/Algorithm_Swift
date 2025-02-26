//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 2/26/25.
//

import Foundation

// n! = n * (n - 1) * (n - 2) * ... * 1
func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    return n * factorial(n - 1)
}

print(factorial(5))

