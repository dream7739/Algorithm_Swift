//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/14/25.
//

import Foundation

// 1676 팩토리얼 0의 개수
// N!에서 뒤에서부터 처음 0이 아닌 숫자가 나올 때까지 0의 개수를 구하는 프로그램을 작성하시오.
// 5의 제곱수로 나누기(2는 충분히 많기 때문에 5가 0을 만드는 역할)
// 10! = 10 / 10(5*2)

let n = Int(readLine()!)!
var answer = 0
var divisor = 5

while divisor <= n {
    answer += (n / divisor)
    divisor *= 5
}

print(answer)
