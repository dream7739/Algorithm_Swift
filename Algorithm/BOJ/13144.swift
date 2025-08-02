//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/2/25.
//

import Foundation

// 13144 List of Unique Numbers
// 연속한 1개 이상의 수를 뽑았을 때 같은 수가 여러번 등장하지 않는 경우
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var start = 0
var end = 0
var answer = 0
var set = Set<Int>()

while end < n {
    if !set.contains(arr[end]) {
        set.insert(arr[end])
        answer += set.count
        end += 1
    } else {
        // 중복수 제거
        set.remove(arr[start])
        start += 1
    }
}

print(answer)
