//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/10/25.
//

import Foundation

// 1181 단어 정렬

let n = Int(readLine()!)!
var words = Set<String>()

for _ in 0..<n {
    words.insert(readLine()!)
}

let sortedWords = words.sorted {
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
}

for word in sortedWords {
    print(word)
}
