//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/24/25.
//

import Foundation

// 17413 단어 뒤집기 2
let input = readLine()!
var word = ""
var answer = ""
var isTag = false

for ch in input {
    if ch == "<" {
        answer += word.reversed()
        word = ""
        isTag = true
        answer.append(ch)
    } else if ch == ">" {
        isTag = false
        answer.append(ch)
    } else if isTag {
        answer.append(ch)
    } else {
        if ch == " " {
            answer += word.reversed()
            word = ""
            answer.append(ch)
        } else {
            word.append(ch)
        }
    }
}

if !word.isEmpty {
    answer += word.reversed()
}

print(answer)
