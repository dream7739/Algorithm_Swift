//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/6/25.
//

import Foundation

// 20437 문자열 게임2
// 어떤 문자를 정확히 K개를 포함하는 가장 짧은 연속 문자열의 길이
// 어떤 문자를 정확히 K개를 포함하고, 문자열의 첫 번째와 마지막 글자가 해당 문자로 같은 가장 긴 연속 문자열의 길이
// 공백을 두고 출력하되 만족하지 못하면 -1을 출력

let cnt = Int(readLine()!)!

for _ in 0..<cnt {
    let str = readLine()!
    let n = Int(readLine()!)!
    
    var positions = [Character: [Int]]()
    
    for (idx, s) in str.enumerated() {
        positions[s, default: []].append(idx)
    }
    
    var minLen = Int.max
    var maxLen = Int.min
    
    for (_, indicies) in positions {
        if indicies.count < n { continue }
        
        for i in 0...(indicies.count - n) {
            let len = indicies[i + n - 1] - indicies[i] + 1
            minLen = min(len, minLen)
            maxLen = max(len, maxLen)
        }
    }
    
    if minLen == Int.max {
        print(-1)
    } else {
        print(minLen, maxLen)
    }
}
