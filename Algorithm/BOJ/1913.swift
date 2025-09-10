//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/9/25.
//

import Foundation

// 1913 달팽이

// 3, 2, 2, 1, 1
// 5, 4, 4, 3, 3, 2, 2, 1, 1

// 아래쪽, 오른쪽, 위쪽, 왼쪽
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)

var start = n * n
var dir = [(1, 0), (0, 1), (-1, 0), (0, -1)]
var dirIdx = 0
var loc = (0, 0)
var x = 0
var y = 0

arr[x][y] = start
if start == m { loc = (x + 1, y + 1) }
start -= 1

while start > 0 {
    let currentDir = dir[dirIdx % dir.count]
    let nx = x + currentDir.0
    let ny = y + currentDir.1

    if nx >= n || nx < 0 || ny >= n || ny < 0 || arr[nx][ny] != 0 {
        dirIdx += 1
        continue
    }
    
    x = nx
    y = ny
    arr[x][y] = start
    
    if start == m { loc = (x + 1, y + 1) }
    
    start -= 1
}

for row in arr {
    print(row.map { String($0) }.joined(separator: " "))
}

print("\(loc.0) \(loc.1)")
