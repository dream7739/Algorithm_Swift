//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/10/25.
//

import Foundation

// 9012 괄호
// 올바른 괄호이면 "YES", 아니면 "NO"

let input = Int(readLine()!)!
var arr: [Character] = []

for _ in 0..<input {
    let str = readLine()!
    
    for s in str {
        if s == "(" {
            arr.append(s)
        } else if s == ")" {
            if let peek = arr.last, peek == "(" {
                arr.removeLast()
            } else {
                arr.append(s)
            }
        }
    }
    
    arr.isEmpty ? print("YES") : print("NO")
    arr = []
}


