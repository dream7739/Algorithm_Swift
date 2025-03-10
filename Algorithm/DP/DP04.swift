//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/10/25.
//

import Foundation

// p.226 효율적인 화폐 구성

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]; let k = input[1]
var arr = Array.init(repeating: 0, count: n)
var d = Array.init(repeating: 10001, count: 10001)

for i in 0..<n {
    arr[i] = Int(readLine()!)!
}

d[0] = 0

// 화폐 단위 수만큼 반복
for i in 0..<n {
    if arr[i] > k { continue } // 만약 k보다 크다면 애초에 구성이 불가능하다.
    
    // 테이블 구성
    for j in arr[i]...k {
        // 7일 경우, 화폐가 2라고 가정
        // d[7 - 2] != 10001 > d[5]값이 있다면 1을 더해본다.
        // d[7]값과 비교하여 더 작은 값을 d[7]로 한다.
        if d[j - arr[i]] != 10001 {
            d[j] = min(d[j - arr[i]] + 1, d[j])
        }
    }
}

if d[k] == 10001 {
    print(-1)
} else {
    print(d[k])
}
