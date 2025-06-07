//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/7/25.
//

import Foundation

// 16472 고냥이
// N개의 알파벳을 포함한 가장 긴 연속수열의 최대 길이

let n = Int(readLine()!)!
let arr = readLine()!.map { String($0) }
var chk = [String: Int]()

var start = 0
var answer = 0

for end in 0..<arr.count {
    chk[arr[end], default: 0] += 1
    
    while chk.count > n {
        chk[arr[start]]! -= 1
        
        // 0이면 완전히 제거해서, 카운팅될 때 제외되도록 함
        if chk[arr[start]]! == 0 {
            chk.removeValue(forKey: arr[start])
        }
        start += 1
    }
    answer = max(answer, end - start + 1)
}

print(answer)
