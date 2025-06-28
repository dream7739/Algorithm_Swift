//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 6/28/25.
//

import Foundation

// 17952 과제는 끝나지 않아!

// 과제는 가장 최근에 나온 순서대로 한다. 또한 과제를 받으면 바로 시작한다.
// 과제를 하던 도중 새로운 과제가 나온다면, 하던 과제를 중단하고 새로운 과제를 진행한다.
// 새로운 과제가 끝났다면, 이전에 하던 과제를 이전에 하던 부분부터 이어서 한다.

let input = Int(readLine()!)! // 한 학기 몇분인지
var stack = [(grade: Int, minute: Int)]()
var answer = 0

for _ in 0..<input {
    let cmd = readLine()!.split(separator: " ").map { Int($0)! }
    
    if cmd[0] == 0 {
        if var last = stack.popLast() {
            last.minute -= 1
            
            if last.minute == 0 {
                answer += last.grade
            } else {
                stack.append(last)
            }
        }
    } else if cmd[0] == 1 {
        let comp = (grade: cmd[1], minute: cmd[2] - 1)
        if comp.minute == 0 {
            answer += comp.grade
        } else {
            stack.append(comp)
        }
    }
}

print(answer)
