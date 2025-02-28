//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 2/28/25.
//

import Foundation

// 이진탐색: O(logN)
// 데이터가 정렬되어있을 때 빠르게 탐색이 가능
// 1. 재귀로 구현

@discardableResult
func binarySearch1(arr: [Int], target: Int, start: Int, end: Int) -> Int {
    if start > end { return -1 }
    let mid = (start + end) / 2
    
    if target == arr[mid] {
        return mid
    } else if target < arr[mid] {
        return binarySearch1(arr: arr, target: target, start: start, end: mid - 1)
    } else {
        return binarySearch1(arr: arr, target: target, start: mid + 1, end: end)
    }
}

@discardableResult
func binarySearch2(arr: [Int], target: Int, start: Int, end: Int) -> Int {
    var start = start
    var end = end
    
    while start <= end {
        let mid = (start + end) / 2
        if target == arr[mid] {
            return mid
        } else if target < arr[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return -1
}


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let target = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let answer = binarySearch1(arr: arr, target: target, start: 0, end: n - 1)

if answer == -1 {
    print("원소가 존재하지 않습니다.")
} else {
    print(answer + 1)
}


