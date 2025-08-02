//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/2/25.
//

import Foundation

// 8911 거북이

// 북, 동, 남, 서
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

func move(x: Int, y: Int, _ cmd: [String]) -> Int {
    var dir = 0
    var x = x
    var y = y
    var minX = 0, maxX = 0, minY = 0, maxY = 0
    
    for m in cmd {
        if m == "F" {
            x = x + dx[dir]
            y = y + dy[dir]
        } else if m == "B" {
            x = x - dx[dir]
            y = y - dy[dir]
        } else if m == "L" {
            dir = (dir + 3) % 4
        } else if m == "R" {
            dir = (dir + 1 ) % 4
        }
        minX = min(minX, x)
        maxX = max(maxX, x)
        minY = min(minY, y)
        maxY = max(maxY, y)
    }
    
    return (maxX - minX) * (maxY - minY)
}

let n = Int(readLine()!)!
var answer = [Int]()
for _ in 0..<n {
    let cmd = readLine()!.map { String($0) }
    answer.append(move(x: 0, y: 0, cmd))
}
                  
for num in answer {
    print(num)
}
                  
