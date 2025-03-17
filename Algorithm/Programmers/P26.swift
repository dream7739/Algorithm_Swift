//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/17/25.
//

import Foundation

// 모음 사전
// 완전탐색
// words: [""]
// DFS("A") DFS("E") DFS("I") DFS("O") DFS("U")
// words: ["", "A"]
// DFS("AA") DFS("AE") DFS("AI") DFS("AO") DFS("AU")
// words: ["", "A", "AA"]
// DFS("AAA") DFS("AAE")...
// words: ["", "A", "AA", "AAA"]

func solution(_ word:String) -> Int {
    let arr = ["A", "E", "I", "O", "U"]
    var words = [String]()
    
    func DFS(_ str: String) {
        words.append(str)
        
        if str.count == 5 { return }
        
        for i in 0..<arr.count {
            DFS(str + arr[i])
        }
    }
    
    DFS("")
    return words.firstIndex(of: word)!
}

print(solution("AAAAE"))
