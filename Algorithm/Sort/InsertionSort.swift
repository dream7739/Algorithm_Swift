//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/6/25.
//

import Foundation

// 삽입 정렬
// 두번째 원소부터 앞의 값들과 비교해서 알맞은 자리에 삽입
// In Place: 추가적인 공간 사용이 없다
// Stable(=이 있는 경우 Unstable): 순서가 뒤바뀌지 않는다
// O(N^2), 최선 O(N) - 비교만 하고 교체하지 않는 경우 존재
var arr = [7, 4, 5, 1, 3]

func insertionSort(_ list: inout [Int]) {
    for i in 1..<list.count {
        for j in stride(from: i, to: 0, by: -1) {
            if list[j] < list[j - 1] {
                list.swapAt(j, j - 1)
            } else {
                break
            }
        }
    }
}

insertionSort(&arr)
print(arr)
