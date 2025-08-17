//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/17/25.
//

import Foundation

// 20920 영단어 암기는 괴로워
// 자주 나오는 단어일수록 앞에 배치한다.
// 해당 단어의 길이가 길수록 앞에 배치한다.
// 알파벳 사전 순으로 앞에 있는 단어일수록 앞에 배치한다

// 길이가 M 이상인 단어만 외움

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var words: [String: Int] = [:]

for _ in 0..<n {
    let input = readLine()!
    if input.count >= m {
        words[input, default: 0] += 1
    }
}

let answer = words.sorted {
    if $0.value == $1.value {
        if $0.key.count == $1.key.count {
            return $0.key < $1.key
        } else {
            return $0.key.count > $1.key.count
        }
    } else {
        return $0.value > $1.value
    }
}

for word in answer {
    print(word.key)
}
