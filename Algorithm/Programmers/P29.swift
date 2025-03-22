//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/22/25.
//

import Foundation

// 최소직사각형
// 큰 건 큰쪽으로, 작은 건 작은쪽으로 모아야 함.
// 가장 큰 값들 중 큰값 * 가장 작은값들 중 큰값 -> 최소값
func solution(_ sizes:[[Int]]) -> Int {
    var m: [Int] = []
    var n: [Int] = []
    for size in sizes {
        m.append(max(size[0], size[1]))
        n.append(min(size[0], size[1]))
    }
    return m.max()! * n.max()!
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))

// 80 70
// 80 50
