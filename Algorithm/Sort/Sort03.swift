//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 2/27/25.
//

import Foundation

// p.182 두 배열의 원소 교체

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

var arr1 = readLine()!.split(separator: " ").map { Int($0)! }
var arr2 = readLine()!.split(separator: " ").map { Int($0)! }

arr1.sort { $0 < $1 }
arr2.sort { $0 > $1 }

for i in 0..<k {
    if arr1[i] < arr2[i] {
        let tmp = arr1[i]
        arr1[i] = arr2[i]
        arr2[i] = tmp
    } else {
        // 정렬한 동일 위치에서 더 작은 값이라면 더 이상 옮길 필요가 없다.
        break
    }
}

print(arr1.reduce(0, +))
