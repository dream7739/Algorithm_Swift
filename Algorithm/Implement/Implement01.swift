//
//  Implement01.swift
//  Algorithm
//
//  Created by 홍정민 on 12/30/24.
//

import Foundation
// 구현 예제 4-1
// N * N에서 상하좌우로 이동하여 최종적으로 도착하는 좌표

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { String($0) }

let point = ["L": (0, -1), "R": (0, 1), "U": (-1, 0), "D": (1, 0)]
var current = (1, 1)

for dir in input {
    let dx = current.0 + point[dir]!.0
    let dy = current.1 + point[dir]!.1
    
    // 좌표가 N * N에서 벗어나는지 체크
    // X는 1~N 이내, Y도 1~N 이내
    if dx < 1 || dx > n || dy < 1 || dy > n {
        continue
    }
    
    // 좌표가 유효 하다면 해당 방향으로 이동하기
    current = (dx, dy)
}

print(current.0, current.1)
