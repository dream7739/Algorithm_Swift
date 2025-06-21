//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/21/25.
//

import Foundation

// 15565 귀여운 라이언
// 라이언 인형은 1, 어피치 인형은 2
// 라이언인형이 K개 이상 있는 가장 작은 부분 수열 크기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)!}

var left  = 0
var right = 0
var answer = Int.max
var dic = [1: 0, 2: 0]

while right < n {
    dic[arr[right]]! += 1
    
    while dic[1]! >= k {
        answer = min(answer, right - left + 1)
        if arr[left] == 1 { dic[1]! -= 1 }
        left += 1
    }
    
    right += 1
}

print(answer == Int.max ? -1 : answer)
