//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 1/6/25.
//

import Foundation

// 버블 정렬
// 두 개의 인접 원소를 비교해 순서에 맞지 않으면 교환한다
// In Place: 추가적인 공간 사용이 없다
// Stable(=이 있는 경우 Unstable): 순서가 뒤바뀌지 않는다
// O(N^2)

var arr = [7, 4, 5, 1, 3]

func bubbleSort(_ list: inout [Int]) -> [Int] {
    for i in 0..<list.count {
        for j in 0..<list.count - 1 - i {
            if list[j] > list[j+1] {
                list.swapAt(j, j+1)
            }
        }
    }
    return list
}

func bubbleSortSwap(_ list: inout [Int]) -> [Int] {
    for i in 0..<list.count {
        var isSwap = false
        
        for j in 0..<list.count - 1 - i {
            if list[j] > list[j+1] {
                list.swapAt(j, j+1)
                isSwap = true
            }
        }
        
        // 한 번도 바뀌지 않았다면 전체 정렬된 상태
        if isSwap == false { break }
    }
    return list
}


//print(bubbleSort(&arr))
print(bubbleSortSwap(&arr))
