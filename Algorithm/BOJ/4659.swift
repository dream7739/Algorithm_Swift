//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/17/25.
//

import Foundation

// 4659 비밀번호 발음하기
// 모음(a,e,i,o,u) 하나를 반드시 포함하여야 한다.
// 모음이 3개 혹은 자음이 3개 연속으로 오면 안 된다.
// 같은 글자가 연속적으로 두번 오면 안되나, ee 와 oo는 허용한다.

let vowels: Set<String> = ["a", "e", "i", "o", "u"]

func isAvailablePassword(_ pwd: String) -> Bool {
    let str = pwd.map { String($0) }
    
    var isContainVowel = false
    var consonantCount = 0
    var vowelCount = 0
    
    for i in 0..<str.count {
        let s = str[i]
        let isVowel = vowels.contains(s)
        
        if isVowel {
            isContainVowel = true
            vowelCount += 1
            consonantCount = 0
        } else {
            vowelCount = 0
            consonantCount += 1
        }
        
        if vowelCount >= 3 || consonantCount >= 3 {
            return false
        }
        
        if i > 0 && str[i] == str[i - 1] && s != "e" && s != "o" {
            return false
        }
    }
    
    return isContainVowel
}

while let line = readLine(), line != "end" {
    if isAvailablePassword(line) {
        print("<\(line)> is acceptable.")
    } else {
        print("<\(line)> is not acceptable.")
    }
}
