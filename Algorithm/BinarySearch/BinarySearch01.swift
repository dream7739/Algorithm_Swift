//
//  BinarySearch01.swift
//  Algorithm
//
//  Created by 홍정민 on 2/28/25.
//

import Foundation

// p.197 부품찾기

// 5
// 8 3 7 9 2
// 손님이 찾는 물건 리스트
// 3
// 3 7 9

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let m = Int(readLine()!)!
let k = readLine()!.split(separator: " ").map { Int($0)! }

func binarySearch(arr: [Int], target: Int, start: Int, end: Int) -> Bool {
    var start = start
    var end = end
    
    while start <= end {
        let mid = (start + end) / 2
        
        if arr[mid] == target {
            return true
        } else if target < arr[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return false
}

for target in k {
    let isExist = binarySearch(arr: arr, target: target, start: 0, end: n - 1)
    
    if isExist {
        print("yes")
    } else {
        print("no")
    }
}

