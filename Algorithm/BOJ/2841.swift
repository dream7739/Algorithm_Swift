//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/1/25.
//

import Foundation

// 2841 외계인의 기타연주
// 음의 수, 프렛의 수
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

// 줄의 번호, 프렛의 번호 입력
// 줄은 6개, 프렛은 1-M
var stack = Array(repeating: [Int](), count: 7)
var answer = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let l = input[0]
    let p = input[1]
    
    // 1. 해당 줄에 아무것도 누른 적이 없을 때
    // 2. 해당 줄에 프랫이 눌러져있고, 이 프랫이 현재 프랫보다 높을 때
    // 3. 해당 줄에 프랫이 눌러져있고, 이 프랫이 현재 프랫보다 낮을 때
    if stack[l].isEmpty {
        stack[l].append(p)
        answer += 1
        continue
    }
    
    if let last = stack[l].last {
        if last < p {
            stack[l].append(p)
            answer += 1
        } else if last > p {
            while let last = stack[l].last, last > p {
                stack[l].removeLast()
                answer += 1
            }
            
            // 같은 프렛이 아닌 경우에만 새로 눌러줌
            if stack[l].last != p {
                stack[l].append(p)
                answer += 1
            }
        }
    }
}

print(answer)
