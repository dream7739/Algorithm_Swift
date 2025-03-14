//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/14/25.
//

import Foundation

// JadenCase 문자열 만들기
func solution(_ s:String) -> String {
    var isWhiteSpace = true
    var answer = ""
    
    for str in s {
        if isWhiteSpace {
            answer += str.uppercased()
        } else {
            answer += str.lowercased()
        }
        
        isWhiteSpace = str.isWhitespace
    }
    
    return answer
}

print(solution("3people unFollowed me"))
print(solution("for the last week"))
