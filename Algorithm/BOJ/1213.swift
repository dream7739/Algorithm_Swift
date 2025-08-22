//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 8/22/25.
//

import Foundation

// 1213 팰린드롬 만들기
// 팰린드롭: 앞에서 읽던 뒤에서 읽던 동일한 문자열
// 짝수 길이 문자열: 모든 문자 개수 = 짝수
// 홀수 길이 문자열: 한 문자 개수 = 홀수, 나머지 문자 개수 = 짝수
// 홀수 개수를 가진 문자가 1개 이상이면 팰린드롭 불가능

let input = readLine()!
var dic = [Character: Int]()
var answer = ""

for char in input {
    dic[char, default: 0] += 1
}

let oddCnt = dic.filter { $0.value % 2 != 0 }.count

if oddCnt > 1 {
    print("I'm Sorry Hansoo")
} else {
    let tmp = dic.sorted { $0.key < $1.key }
    var front = ""
    var mid = ""
    
    for (char, count) in tmp {
        let half = count / 2
        front += String(repeating: char, count: half)
        
        if count % 2 != 0 {
            mid = String(char)
        }
    }
    
    let back = String(front.reversed())
    print(front + mid + back)
}
