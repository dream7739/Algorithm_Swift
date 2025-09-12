//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/12/25.
//

import Foundation

// 1018 체스판 다시 칠하기
// 8×8 크기의 체스판으로 잘라낸 후에 몇 개의 정사각형을 다시 칠함
// 체스판을 색칠하는 경우는 두 가지뿐이다. 하나는 맨 왼쪽 위 칸이 흰색인 경우, 하나는 검은색인 경우
// 지민이가 다시 칠해야 하는 정사각형의 최소 개수를 구하는 프로그램을 작성

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = Array.init(repeating: Array.init(repeating: "", count: m), count: n)

for i in 0..<n {
    let str = readLine()!.map { String($0) }
    arr[i] = str
}

var answer = Int.max

// 8x8을 넘어가는 부분 제외
// 왼쪽 위 기준으로 흰색일 경우
// W가 (0, 0), (0, 2), (0, 4) 짝수
// B가 (0, 1), (0, 3), (0, 5) 홀수

// 왼쪽 위 기준으로 검정색인 경우
// B가 (0, 0), (0, 2), (0, 4) 짝수
// W가 (0, 1), (0, 3), (0, 5) 홀수

for i in 0...n-8 {
    for j in 0...m-8 {
        // i, j가 시작점이 되고, 여기서 8x8을 만들어야 함
        // i + x(0~7), j + y(0~7)
        var countW = 0
        var countB = 0
        for x in 0..<8 {
            for y in 0..<8 {
                let idx = x + y
                let color = arr[i + x][j + y]
                
                if idx % 2 == 0 {
                    if color != "W" { countW += 1 }
                    if color != "B" { countB += 1 }
                } else {
                    if color != "B" { countW += 1 }
                    if color != "W" { countB += 1 }
                }
            }
        }
        
        answer = min(answer, min(countW, countB))
    }
}

print(answer)
