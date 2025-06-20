//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/20/25.
//

import Foundation

// 22862 가장 긴 짝수 연속한 부분 수열
// S에서 최대 K번 원소를 삭제한 수열에서 짝수로 이루어진 연속 부분수열 최대 길이
// 같은 곳에서 시작하는 투포인터
// 겹치는건 싫어와 유사
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0
var oddCnt = 0

var left = 0
var right = 0

while right < n {
    if arr[right] % 2 == 1 {
        oddCnt += 1
    }
    
    // 홀수가 K를 초과한 경우 구간을 줄이기
    while oddCnt > k {
        if arr[left] % 2 == 1 {
            oddCnt -= 1
        }
        left += 1
    }
    
    answer = max(answer, right - left + 1 - oddCnt)
    right += 1
}

print(answer)
