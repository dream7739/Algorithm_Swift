//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/6/25.
//

import Foundation

// 선택 정렬
// 정렬되지 않은 부분에서 가장 작은 값을 찾고, 찾은 값으로 교체
// 맨 처음부터 하나씩 정렬됨
// In Place: 추가적인 공간 사용이 없다
// Stable(=이 있는 경우 Unstable): 순서가 뒤바뀌지 않는다
// O(N^2)

var arr = [7, 4, 5, 1, 3]

func selectionSort(_ list: inout [Int]) {
    for i in 0..<list.count - 1 {
        var minIndex = i
        for j in i+1..<list.count {
            if list[j] < list[minIndex] {
                minIndex = j
            }
        }
        list.swapAt(i, minIndex)
    }
}

selectionSort(&arr)
print(arr)
