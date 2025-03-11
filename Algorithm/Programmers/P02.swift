//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/11/25.
//

import Foundation

//문제 설명
//정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.
//
//제한 사항
//n은 0 이상 3000이하인 정수입니다.
//입출력 예
//n    return
//12    28
//5    6
//입출력 예 설명
//입출력 예 #1
//12의 약수는 1, 2, 3, 4, 6, 12입니다. 이를 모두 더하면 28입니다.
//
//입출력 예 #2
//5의 약수는 1, 5입니다. 이를 모두 더하면 6입니다.

func solution(_ n:Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        let result = Array(1...n).filter { n % $0 == 0 }.reduce(0, +)
        return result
    }
}

print(solution(12))
print(solution(5))
