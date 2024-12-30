//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 12/27/24.
//

// O(1) > O(logN) > O(N) > O(NlogN) > O(N^2) > O(N^3) > O(2^N)

// Greedy 예제 3-1
// 거스름돈
import Foundation

var input = Int(readLine()!)!
let coins = [500, 100, 50, 10]
var answer = 0

for coin in coins {
    answer += (input / coin)
    input %= coin
}

print(answer)
