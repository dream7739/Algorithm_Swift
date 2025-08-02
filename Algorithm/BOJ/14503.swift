//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/2/25.
//

import Foundation

// 14503 로봇청소기

func cleanUp(x: Int, y: Int, dir: Int) {
    // 현재 칸이 아직 청소되지 않은 경우, 현재 칸을 청소한다.
    if arr[x][y] == 0 {
        arr[x][y] = 2
        answer += 1
    }
    
    // 4칸 중 청소되지 않은 빈 칸이 있는 경우
    var newDir = dir
    for _ in 0..<4 {
        // 반시계 회전
        newDir = (newDir + 3) % 4
        let nx = x + dx[newDir]
        let ny = y + dy[newDir]
        
        if nx >= 0, nx < n, ny >= 0,  ny < m, arr[nx][ny] == 0 {
            cleanUp(x: nx, y: ny, dir: newDir)
            return
        }
    }
    
    // 4칸 중 청소되지 않은 빈 칸이 없는 경우
    // 바라보는 방향을 유지한 채로 한 칸 후진할 수 있다면 한 칸 후진하고 1번으로 돌아간다.
    let backDir = (dir + 2) % 4
    let nx = x + dx[backDir]
    let ny = y + dy[backDir]
    
    if nx >= 0, nx < n, ny >= 0, ny < m, arr[nx][ny] != 1 {
        cleanUp(x: nx, y: ny, dir: dir)
        return
    } else {
        return
    }
}

// 0, 1, 2, 3 (북, 동, 남, 서)
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

let input1 = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input1[0], input1[1])
let input2 = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, dir) = (input2[0], input2[1], input2[2])

var arr = [[Int]]()
var answer = 0
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

cleanUp(x: r, y: c, dir: dir)
print(answer)
