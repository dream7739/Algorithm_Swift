//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 5/4/25.
//

import Foundation

// 21918 전구
// N개 전구, M개 명령어
// 명령어 a b c
// a는 a번째 명령어
// b와 c는 a가 1인 경우에 i, x
// a가 2, 3, 4인 경우에 l, r

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var light = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 0..<m {
    let cmd = readLine()!.split(separator: " ").map { Int($0)! }
    let a = cmd[0]
    let b = cmd[1]
    let c = cmd[2]
    
    let li = b - 1
    let ri = c - 1
    
    switch a {
    case 1:
        light[li] = c
    case 2:
        for j in li...ri {
            if light[j] == 0 {
                light[j] = 1
            } else {
                light[j] = 0
            }
        }
    case 3:
        for j in li...ri {
            light[j] = 0
        }
    case 4:
        for j in li...ri {
            light[j] = 1
        }
    default:
        break
    }
    
}

print(light.map(String.init).joined(separator: " "))
