//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/21/25.
//

import Foundation


// 소수찾기
func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    
    for i in 2..<Int(sqrt(Double(num))) + 1 {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ numbers:String) -> Int {
    var check = Array.init(repeating: false, count: numbers.count)
    var answer = Set<Int>()

    func DFS(_ str: String) {
        let num = Int(str) ?? 0
        if isPrime(num) { answer.insert(num) }
        
        for i in 0..<numbers.count {
            if check[i] == false {
                check[i] = true
                let index = numbers.index(numbers.startIndex, offsetBy: i)
                DFS(str + String(numbers[index]))
                check[i] = false
            }
        }
    }
    
    DFS("")
    return answer.count
}

print(solution("17"))
print(solution("011"))
