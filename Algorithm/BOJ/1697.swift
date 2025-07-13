//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/13/25.
//

import Foundation

// 1697 숨바꼭질

// 수빈 N, 동생 K
// 1초 후 위치 = X - 1, X + 1, 2 * X
// 수빈이가 동생을 찾는 가장 빠른 시간
// 시간초과 나서 다시 품
// dequeue 방식 차이: removeFirst() = O(N), 포인터 사용 = O(1)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var queue = [(x: Int, minute: Int)]()
var head = 0
var visited = Array.init(repeating: false, count: 100001)

func BFS(x: Int) -> Int {
    queue.append((x, 0))
    visited[x] = true
    
    while head < queue.count {
        let cur = queue[head]
        head += 1
        let x = cur.x
        let minute = cur.minute
        
        if x == k { return minute }
        
        let dx = [x - 1, x + 1, x * 2]
        for nx in dx {
            if nx < 0 || nx > 100000 || visited[nx] { continue }
            visited[x] = true
            queue.append((nx, minute + 1))
        }
        
    }
    return -1
}

print(BFS(x: n))
