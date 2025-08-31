//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/31/25.
//
import Foundation

// 1522 문자열 교환
// 1. a가 총 몇개 있는지 확인
// 2. a 개수의 윈도우 안에 b를 카운팅 -> 교체 개수
// 3. 원형 문자열: 두배로 확장

let input = Array(readLine()!)
var doubled = input + input
var aCnt = input.filter { $0 == "a" }.count
var bCnt = 0

for i in 0..<aCnt {
    if doubled[i] == "b" {
        bCnt += 1
    }
}

var answer = bCnt

for i in 1..<input.count {
    // 이전값
    if doubled[i - 1] == "b" {
        bCnt -= 1
    }
    
    // 새로운 값
    if doubled[i + aCnt - 1] == "b" {
        bCnt += 1
    }
    
    answer = min(bCnt, answer)
}

print(answer)
