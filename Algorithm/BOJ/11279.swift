//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/17/25.
//

import Foundation

// 11279 최대힙
struct MaxHeap<T: Comparable> {
    private var elements: [T] = []
    
    private func parent(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChild(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    var count: Int {
        return elements.count
    }
    
    private mutating func diveDown(of index: Int) {
        var biggest = index
        let left = leftChild(of: index)
        let right = rightChild(of: index)
        
        if left < elements.count && elements[left] > elements[biggest] {
            biggest = left
        }
        
        if right < elements.count && elements[right] > elements[biggest] {
            biggest = right
        }
        
        if index != biggest {
            elements.swapAt(biggest, index)
            diveDown(of: biggest)
        }
        
    }
    
    private mutating func swimUp(of index: Int) {
        var index = index
        while index > 0 && elements[index] > elements[parent(of: index)] {
            elements.swapAt(index, parent(of: index))
            index = parent(of: index)
        }
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        swimUp(of: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 { return elements.removeLast() }
        let max = elements[0]
        elements[0] = elements.removeLast()
        diveDown(of: 0)
        return max
    }
}

var maxHeap = MaxHeap<Int>()
let n = Int(readLine()!)!

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    if input == 0 {
        print(maxHeap.remove() ?? 0)
    } else {
        maxHeap.insert(input)
    }
}
