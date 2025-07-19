//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/19/25.
//

import Foundation

// Lower Bound Binary Search
// 특정 값과 같거나 큰값이 처음 나오는 위치 찾기
// O(logN)

func binarySearchLowerBound(arr: [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] < target {
            start = mid + 1 // 작은값이면 무조건 우측 이동
        } else {
            end = mid
        }
    }
    
    return start
}


// Upper Bound Binary Search
// 특정 값보다 처음으로 큰 위치 찾기
func binarySearchUpperBound(arr: [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] <= target { // 작거나 같은 값이면 우측 이동
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return start
}


var arr = [1, 2, 2, 3, 3, 3, 5, 6, 8]
print(binarySearchLowerBound(arr: arr, target: 3))
print(binarySearchUpperBound(arr: arr, target: 3))
