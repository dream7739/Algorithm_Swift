//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/15/25.
//

import Foundation

// 2531 회전초밥
// 접시수, 초밥 가지수, 연속 접시 수, 쿠폰번호

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, d, k, c) = (input[0], input[1], input[2], input[3])

var arr = [Int]()

for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}
// 회전하기 때문에 k만큼이 더 붙어야 함
arr += arr[0..<k]

var chk: [Int: Int] = [Int: Int]()

for i in 0..<k {
    chk[arr[i], default: 0] += 1
}

chk[c, default: 0] += 1

// 슬라이딩 윈도우
var answer = chk.count
for end in k..<(n + k) {
    let after = arr[end]
    let before = arr[end - k]
    chk[after, default: 0] += 1
    chk[before, default: 0] -= 1
    
    if chk[before] == 0 {
        chk.removeValue(forKey: before)
    }
    
    answer = max(answer, chk.count)
}
print(answer)
