//
//  Implement02.swift
//  Algorithm
//
//  Created by 홍정민 on 12/30/24.
//

import Foundation
// 구현 예제 4-2
// 시각
// N이 입력되면 00시 00분 00초부터 N시 59분 59초까지 3이 하나라도 포함되는 수
// 시간 24시간 * 분 60분 * 초 60초 = 86400가지
// 00: 00: 00 ~ 00: 00: 59
// 00: 01: 00 ~ 00: 01: 59
// 00: 59: 00 ~ 00: 59: 59

let input = Int(readLine()!)!
var answer = 0

// input = 5 > 5시 59분 59초 > input + 1
for i in 0..<input + 1 {
    for j in 0..<60 {
        for k in 0..<60 {
            let time = String(i) + String(j) + String(k)
            if time.contains("3") {
                answer += 1
            }
        }
    }
}

print(answer)
