//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 2/28/25.
//

import Foundation

// p. 201 떡볶이 떡 만들기


// 떡의 개수, 요청한 떡의 길이
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

func binarySearch(arr: [Int], start: Int, end: Int) -> Int {
    var start = start
    var end = end
    var result = 0
    
    while start <= end {
        let mid = (start + end) / 2
        var total = 0
        
        // 떡을 잘라 결과를 확인
        for num in arr {
            if num > mid {
                total += num - mid
            }
        }
        
        // 정확하게 떨어지는 값으로 잘린다면 바로 리턴
        if total == m {
            return mid
        }
        
        // 길이가 목표치보다 낮다면 더 작은 수로 잘라야 한다.
        if total < m {
            end = mid - 1
        } else {
            // 길이가 목표치보다 더 많이 나온다면 더 큰 수로 자를 수 있다.
            // 기록해놓고 더 긴 절단기 높이로 자를 수 있는지 확인한다.
            result = mid
            start = mid + 1
        }
    }
    
    return result
}

// 떡볶이 떡은 0~최대값까지 자를 수 있다.
print(binarySearch(arr: arr, start: 0, end: arr.last!))
