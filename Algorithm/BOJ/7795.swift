//
//  1300.swift
//  Algorithm
//
//  Created by 홍정민 on 7/19/25.
//

import Foundation

// 7795 먹을 것인가 먹힐 것인가
// A의 크기가 B보다 큰 쌍이 몇개나 있는지
// M <= 20000, M^2 = 2 * 10^8 = O(N^2) 불가능

let cnt = Int(readLine()!)!
var answer = [Int]()

func binarySearch(arr: [Int], cnt: Int, target: Int) -> Int {
    var start = 0
    var end = cnt
    
    while start < end {
        let mid = (start + end) / 2
        
        if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return start
}

for _ in 0..<cnt {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    var b = readLine()!.split(separator: " ").map { Int($0)! }
    b.sort()
    
    var result = 0
    for i in 0..<n {
        result += binarySearch(arr: b, cnt: m, target: a[i])
    }
    answer.append(result)
}

for num in answer {
    print(num)
}
