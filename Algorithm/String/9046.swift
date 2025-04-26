//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 4/26/25.
//

import Foundation

// 9046 복호화
// 암호문의 알파벳 빈도수를 체크하고 가장 빈번하게 나타나는 문자를 출력

let n = Int(readLine()!)!
var words: [[String]] = []

for _ in 0..<n {
    let input = readLine()!.map { String($0) }.filter { $0 != " "}
    words.append(input)
}

for word in words {
    var dic: [String: Int] = [:]
    
    for s in word {
        dic[s, default: 0] += 1
    }
    
    let maxVal = dic.values.max()
    let maxKeys = dic.filter { $0.value == maxVal }.map { $0.key }
    print(maxKeys.count > 1 ? "?" : maxKeys.first!)
}
