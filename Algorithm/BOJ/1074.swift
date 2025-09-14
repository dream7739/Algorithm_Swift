//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/14/25.
//

import Foundation

// 1074 Z
// 2^N * 2^N 일때
// 2^(N-1) * 2^(N-1)로 4등분
// 한 변의 길이: 2^(N-1), 칸 수: 2^(N-1) * 2^(N-1)

// 어떤 영역에 있는지 확인 후, 칸 수 더하기
// (어떤 영역 * 한 영역의 크기) + (해당 영역에서의 칸 수)
// 결과적으로 4 * 4 영역까지 즉 2^1 * 2^1(N =1)까지 재귀적으로 몇칸을 가야하는지 확인

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x, y) = (input[0], input[1], input[2])

func zIndex(n: Int, x: Int, y: Int) -> Int {
    // 1 * 1 배열이면 무조건 0번
    if n == 0 { return 0 }
    
    // 한 면의 길이
    let half = 1 << (n - 1)
    
    // 한 면의 개수
    let size = half * half
    
    // x, y의 영역 결정
    if x < half && y < half {
        // 영역 1
        // 동일 좌표계 공유
        return zIndex(n: n - 1, x: x, y: y)
    } else if x < half && y >= half {
        // 영역 2
        // 1. 한 영역의 크기 더하기
        // 2. x좌표 동일, y좌표 변경
        return size + zIndex(n: n - 1, x: x, y: y - half)
    } else if x >= half && y < half {
        // 영역 3
        // 1. 두 영역의 크기 더하기
        // 2. x좌표 변경, y좌표 동일
        return size * 2 + zIndex(n: n - 1, x: x - half, y: y)
    } else {
        // 영역 4
        // 1. 세 영역의 크기 더하기
        // 2. x좌표 변경, y좌표 변경
        return size * 3 + zIndex(n: n - 1, x: x - half, y: y - half)
    }
    
}

print(zIndex(n: n, x: x, y: y))
