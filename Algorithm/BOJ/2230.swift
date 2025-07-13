//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/13/25.
//

import Foundation

// 2230 수 고르기
// 차이가 M이상이면서 가장 작은 경우

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = [Int]()
var answer = Int.max
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var p1 = 0
var p2 = 0

while p2 < n {
    // 둘이 동일한 곳을 가리킬 때는 p2를 이동
    if p1 == p2 {
        p2 += 1
        continue
    }
    
    let num = arr[p2] - arr[p1]
    if num >= m {
        answer = min(answer, num)
        p1 += 1
    } else {
        p2 += 1
    }
}

print(answer)
