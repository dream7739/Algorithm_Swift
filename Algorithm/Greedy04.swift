//
//  Greedy04.swift
//  Algorithm
//
//  Created by 홍정민 on 12/28/24.
//

// Greedy 예제 3-4
// 1이 될때까지
// 수행할 수 있는 연산
// 1. N에서 1을 뺀다
// 2. N을 K로 나눈다
// N과 K가 주어질 때 1이 될때까지의 최소 연산 횟수
// 17 4
// 3

// N이 1이면 종료
// N이 K로 나누어 떨어질 경우: N은 K로 나눈 값이되고 answer += 1
// N이 K로 나누어 떨어지지 않을 경우: N을 1감소시키고 answer += 1
// 최대한 많이 나누게 하는 것이 연산 횟수를 줄일 수 있다
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
let k = input[1]
var answer = 0

//while(true) {
//    if n == 1 { break }
//    
//    if n%k == 0 {
//        n /= k
//        answer += 1
//    } else {
//        n -= 1
//        answer += 1
//    }
//}
//
//print(answer)

// 한번에 배수형태로 빼줄 수 있기 때문에 효율적으로 코드를 작성하면 아래와 같아짐
while(true) {
    // N을 K의 배수 형태로 만들기
    let target = (n/k) * k
    
    // 배수가 될때까지 더하기
    answer += (n - target)
    n = target
    
    // N이 K보다 커야 나눌 수 있다
    if n < k { break }
    
    n /= k
    answer += 1
}

// N이 1이 아닐 수도 있기 때문에 1까지 빼주기
answer += (n - 1)
print(answer)


