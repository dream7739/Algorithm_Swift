//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/7/25.
//

import Foundation

// 20922 겹치는 건 싫어
// N인 수열에서 K개 이하로 겹치는 수를 가진 최장 연속 부분 수열 길이

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

var chk = [Int: Int]()
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var answer = 0
var start = 0

for end in 0..<n {
    chk[arr[end], default: 0] += 1
    
    // 카운팅에서 K개 이상이 되었다면 앞쪽에서 중복되는 수를 삭제
    // [3 2 5 5 6 4 4] 5 7 (K: 2)
    // 3 2 5 [5 6 4 4 5] 7
    while chk[arr[end]]! > k {
        chk[arr[start]]! -= 1
        start += 1
    }

    answer = max(answer, end - start + 1)
}

print(answer)
