//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/22/25.
//

import Foundation

// 전력망을 둘로 나누기
// 그래프 & BFS
// 구하고자 하는것: 송전탑 개수가 비슷하게 두 전력망으로 나누었을 때 송전탑 개수 차이
func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max
    var graph: [Int: [Int]] = [:]
    var visited = Array.init(repeating: false, count: n + 1)
    
    // 그래프 초기화
    for i in 1...n {
        graph[i] = []
    }
    
    // 양방향으로 연결관계 정의
    for wire in wires {
        graph[wire[0]]?.append(wire[1])
        graph[wire[1]]?.append(wire[0])
    }
    
    
    // 송전탑의 개수 세기
    func BFS(_ start: Int) -> Int {
        var queue: [Int] = []
        var count = 0
        
        queue.append(start)
        visited[start] = true
        
        while !queue.isEmpty {
            let front = queue.removeFirst()
            count += 1

            for c in graph[front]! {
                if !visited[c] {
                    queue.append(c)
                    visited[c] = true
                }
            }
        }
        
        return count
    }

    
    for i in 1...n {
        visited = Array.init(repeating: false, count: n + 1)
        visited[i] = true  // 방문 처리를 한다 == 방문하지 못한다 == 정점을 끊는다
        let count = BFS(1) // 어디서 시작하던 중요하지 않다.
        result = min(result, abs(count - (n - count))) // count개가 있으면 나머지는 N - count
    }
    
    
    return result
}

print(solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]))
