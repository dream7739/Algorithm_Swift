//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/31/25.
//

import Foundation

// 20291 파일 정리
let input = Int(readLine()!)!
var words = [String: Int]()

for _ in 0..<input {
    let word = readLine()!.split(separator: ".").map { String($0) }
    words[word[1], default: 0] += 1
}

let answer = words.sorted { $0 < $1 }

for comp in answer {
    print("\(comp.key) \(comp.value)")
}
