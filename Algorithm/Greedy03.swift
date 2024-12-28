//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 12/28/24.
//

// Greedy 예제 3-3
// 숫자 카드 게임
// 3 3
// 3 1 2
// 4 1 4
// 2 2 2
// 각 행의 작은 수 중에 가장 큰 수를 찾기
// 1. 2중 for문을 돌면서 각 행의 가장 작은 값을 찾기
// 2. 이전 최대값보다 크면 최대값 교체
// 3. 최종적으로 나온 최대값을 출력
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var arr = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var answer = 0

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
    answer = max(arr[i].min()!, answer)
}

print(answer)
