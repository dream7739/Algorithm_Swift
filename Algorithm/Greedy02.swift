//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 12/27/24.
//

// Greedy 예제 3-2
// 큰 수의 법칙
// 5 8 3
// 2 4 5 4 6
// N 배열개수
// M 번 더해서 얻을 수 있는 가장 큰 수
// K 번까지 연속으로 더할 수 있음
// 6 6 6 5 6 6 6 5
// 36 + 10 = 46

// M <= 10000이므로 O(N)일 경우 시간 초과가 나지 않는다
// M이 100억 이상이라면 시간 초과 가능. 1억번에 1초라고 가정 시 100억번 연산 => 10초 이상
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var m = input[1]
let k = input[2]
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

let arr = numbers.sorted(by: >)
let first = arr[0]
let second = arr[1]

//while(true) {
//    for _ in 0..<k {
//        if m == 0 { break }
//        answer += first
//        m -= 1
//    }
//    if m == 0 { break }
//    answer += second
//    m -= 1
//}
//
//print(answer)

// 가장 큰 수는 몇 번 더해지는지 구하기
// (M / K+1) 수열반복횟수 * K
// (M % K+1) 나머지
// Int(M/(K+1)) * K + M % (K+1)
let count = Int(m/(k+1)) * k + m % (k+1)
answer += count * first
answer += (m - count) * second
print(answer)
