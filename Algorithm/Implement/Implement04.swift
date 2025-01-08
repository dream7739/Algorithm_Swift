//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/8/25.
//

import Foundation
// 구현 예제 4-4
// 게임 개발
// 캐릭터가 방문한 칸의 개수를 출력

// 맵의 크기 N * M
// 캐릭터 좌표 (0북, -1동, -2남, 3서) 캐릭터 방향
// 바다 1, 육지 0
let input1 = readLine()!.split(separator: " ").map { Int($0)! }
let input2 = readLine()!.split(separator: " ").map { Int($0)! }

// 맵 정보 N * M 직사각형
let n = input1[0]
let m = input1[1]
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var check = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var position: (x: Int, y: Int) = (input2[0], input2[1])
check[position.x][position.y] = 1
var answer = 1

// 현재 방향
var current = input2[2]
var dir: [(x: Int, y: Int)] = [(-1, 0), (0, 1), (1, 0), (0, -1)]

// 북 동 남 서 (0, 1, 2, 3)
func turnLeft() {
    current -= 1
    if current == -1 {
        current = 3
    }
}

var turn = 0
var dx = 0
var dy = 0

while true {
    // 1. 네 방향으로 가보기
    // 회전 후 한 칸 이동
    turnLeft()
    dx = position.x + dir[current].x
    dy = position.y + dir[current].y
    
    // 2. 이동한 곳이 방문할 수 있는지 확인
    // 이미 방문했는지, 바다가 아닌지
    if map[dx][dy] == 0 && check[dx][dy] == 0 {
        check[dx][dy] = 1
        answer += 1
        position = (dx, dy)
        turn = 0 // 변경된 위치에서 다시 회전
        continue
    } else {
        turn += 1 // 회전 수를 증가하면서 확인
    }
    
    // 3. 네 방향 다 돈 이후에 확인
    // turn이 4라는 의미 : 네 방향에 어느곳도 갈 수 없었다는 것
    // 현위치에서 방향을 유치한 채 뒤로 간다
    // 바다라면 종료되고, 바다가 아니면 이동한다
    if turn == 4 {
        dx = position.x - dir[current].x
        dy = position.y - dir[current].y
        
        if map[dx][dy] == 1 {
            break
        } else {
            position = (dx, dy)
            turn = 0
        }
    }
}

print(answer)
