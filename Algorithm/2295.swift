//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 7/16/25.
//

import Foundation

// 2295 세 수의 합
// a + b + c = k
// a + b = (k - c)
// 이진탐색으로 바꿔서 풀면 O(n^2log2N)
// N = 1000, 10^7 = 10000000  < 1초

let n = Int(readLine()!)!
var arr = [Int]()
var sum = [Int]()
var answer = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()

for i in 0..<arr.count {
    for j in 0..<arr.count {
        sum.append(arr[i] + arr[j])
    }
}

sum.sort()

func binarySearch(sum: [Int], target: Int) -> Bool {
    var start = 0
    var end = sum.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if target == sum[mid] {
            return true
        } else if target < sum[mid] {
            end = mid - 1
        } else if target > sum[mid] {
            start = mid + 1
        }
    }
    
    return false
}

for i in stride(from: n - 1, through: 0, by: -1) {
    for j in 0..<n {
        let k = arr[i]
        let c = arr[j]
        let target = k - c
        if binarySearch(sum: sum, target: target) {
            print(k)
            exit(0)
        }
    }
}

