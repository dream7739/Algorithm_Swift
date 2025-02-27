//
//  QuickSort.swift
//  Algorithm
//
//  Created by 홍정민 on 2/27/25.
//

import Foundation

var arr = [1, 4, 2, 0, 3, 5, 6, 9, 7, 8]

// 퀵정렬
// 피봇을 기준으로 왼쪽 오른쪽을 분할하여 정렬
// 보통 O(nlogn) 최악의 경우 (On^2)
func quickSort(_ list: [Int]) -> [Int] {
    guard let first = list.first, list.count > 1 else { return list }
    let pivot = first
    
    let left = list.filter { $0 < pivot }
    let right = list.filter { $0 > pivot }
    return quickSort(left) + [pivot] + quickSort(right)
}

// 계수 정렬
// 데이터 개수, 데이터 최대값 N+K O(N+K)
// 데이터 크기가 제한되어 정수형태로 표현할 수 있을 때만 사용 가능
// 가장 큰 데이터 - 가장 작은 데이터 : 1,000,000가 넘지 않을 경우
// 배열을 선언하고 각 수가 몇번 나왔는 지 카운팅 후 최대값만큼 카운팅하며 수를 뽑아냄
var countingArray = [5, 5, 7, 7, 7, 8, 8, 1, 2, 3, 5, 3, 5, 6, 7, 4, 5, 2]
func countSort(_ list: [Int]) -> [Int] {
    var countingArray = Array.init(repeating: 0, count: list.max()! + 1)
    var result = [Int]()

    for num in list {
        countingArray[num] += 1
    }
    
    for i in 0..<list.max()! + 1 {
        // 카운팅 수만큼 결과에 기록해줌
        for _ in 0..<countingArray[i] {
            result.append(i)
        }
    }
    
    return result
}

// 버블 정렬
func bubbleSort(_ list: [Int]) -> [Int] {
    var list = list
    for i in 0..<list.count {
        for j in 0..<list.count - 1 - i  {
            if list[j] > list[j + 1] {
                list.swapAt(j, j + 1)
            }
        }
    }
    return list
}

// 선택 정렬
// 마지막 하나는 이미 정렬된 상태
func selectionSort(_ list: [Int]) -> [Int] {
    var list = list
    for i in 0..<list.count - 1 {
        var minIndex = i
        for j in i+1..<list.count {
            if list[j] < list[minIndex] {
                minIndex = j
            }
        }
        list.swapAt(minIndex, i)
    }
    return list
}

// 삽입 정렬
func insertSort(_ list: [Int]) -> [Int] {
    var list = list
    for i in 1..<list.count {
        for j in stride(from: i, to: 0, by: -1) {
            if list[j] < list[j - 1] {
                list.swapAt(j, j - 1)
            } else {
                break
            }
        }
    }
    return list
}

print(quickSort(arr))
print(bubbleSort(arr))
print(selectionSort(arr))
print(insertSort(arr))
print(countSort(countingArray))
