//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/21/25.
//

import Foundation

// 2467 용액
// 합이 가장 0에 가까운 두 수 찾기

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = n - 1
var cmp = Int.max
var answer = (0, 0)

// 두 값의 합이 0보다 크면 right를 옮겨서 작은 수를 더하도록
// 두 값의 합이 0보다 작으면 left를 옮겨서 큰 수를 더하도록
while left < right {
    let sum = arr[left] + arr[right]
    
    if abs(sum) < abs(cmp) {
        cmp = sum
        answer = (arr[left], arr[right]) // 정답은 오름차순 정렬
    }
    
    if sum > 0 {
        right -= 1
    } else {
        left += 1
    }
}

print(answer.0, answer.1)

