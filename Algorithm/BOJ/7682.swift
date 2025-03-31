//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/31/25.
//

import Foundation

// 7682 틱택토
// 끝나지 못한 상태: XOXOXOXOX - X 5, O 4
// X나 O가 이긴상태로 일찍 끝났을 때
// X가 이긴 상태: O보다 1개 많고 X가 한 줄인 경우
// O가 이긴 상태: X와 개수가 같고 O가 한 줄인 경우

func isWin(_ arr: [[String]], _ str: String) -> Bool {
    for i in 0..<3 {
        // 가로로 한 줄
        if arr[i][0] == str, arr[i][0] == arr[i][1], arr[i][0] == arr[i][2] {
            return true
        }
        
        // 세로로 한 줄
        if arr[0][i] == str, arr[0][i] == arr[1][i], arr[0][i] == arr[2][i] {
            return true
        }
    }
    
    
    // 왼 > 오 대각선
    if arr[0][0] == str, arr[0][0] == arr[1][1], arr[0][0] == arr[2][2] {
        return true
    }
    
    // 오 > 왼 대각선
    if arr[0][2] == str, arr[0][2] == arr[1][1], arr[0][2] == arr[2][0] {
        return true
    }
    
    return false
}


while true {
    let input = readLine()!.map { String($0) }
    if input[0] == "e" { break }
    
    var arr = Array.init(repeating: Array.init(repeating: ".", count: 3), count: 3)
    
    // 9개의 문자열을 3x3 형태로 변경한다.
    // 0(0, 0) 1(0, 1) 2(0, 2)
    // 3(1, 0) 4(1, 1) 5(1, 2)
    
    var o = 0, x = 0
    
    for i in 0..<9 {
        arr[i/3][i%3] = input[i]
        
        if input[i] == "O" {
            o += 1
        } else if input[i] == "X" {
            x += 1
        }
    }
    
    var isValid = false
    let xWin = isWin(arr, "X")
    let oWin = isWin(arr, "O")
    
    
    if xWin, !oWin, x - o == 1 {
        // X가 이겼다
        isValid = true
    } else if oWin, !xWin, x == o {
        // O가 이겼다
        isValid = true
    } else if !xWin && !oWin && x == 5 && o == 4 {
        // 비겼다
        isValid = true
    }
    
    isValid ? print("valid") : print("invalid")
}
