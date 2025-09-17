//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/17/25.
//

import Foundation
// 7662 이중 우선순위 큐
// ‘I n’은 정수 n을 Q에 삽입하는 연산
// ‘D 1’는 Q에서 최댓값을 삭제하는 연산을 의미하며, ‘D-1’는 Q 에서 최솟값을 삭제하는 연산
struct MinHeap<T: Comparable> {
    var elements = [T]()
    
    func parent(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    func peek() -> T? {
        return elements.first
    }
    
    var size: Int {
        return elements.count
    }
    
    private mutating func swimUp(from index: Int) {
        var index = index
        
        while index > 0 && elements[parent(of: index)] > elements[index] {
            elements.swapAt(index, parent(of: index))
            index = parent(of: index)
        }
    }
    
    private mutating func diveDown(from index: Int) {
        let left = leftChild(of: index)
        let right = rightChild(of: index)
        
        var smallest = index
        
        if left < self.elements.count && elements[left] < elements[smallest] {
            smallest = left
        }
        
        if right < self.elements.count && elements[right] < elements[smallest] {
            smallest = right
        }
        
        if smallest != index {
            elements.swapAt(smallest, index)
            diveDown(from: smallest)
        }
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        swimUp(from: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeLast()
        }
        
        let min = elements[0] // 루트노트
        elements[0] = elements.removeLast() // 마지막 리프노드와 교환
        diveDown(from: 0) // 재조정
        
        return min
    }
}

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
    
    func peek() -> T? {
        return elements.first
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


struct DualPriorityQueue {
    var minHeap = MinHeap<Int>()
    var maxHeap = MaxHeap<Int>()
    
    var countDict = [Int: Int]()
    
    mutating func insert(_ value: Int) {
        minHeap.insert(value)
        maxHeap.insert(value)
        
        countDict[value, default: 0] += 1
    }
    
    mutating func removeMax() {
        // 이미 삭제된 값 처리
        while let maxVal = maxHeap.peek(), countDict[maxVal] == nil {
            _ = maxHeap.remove()
        }
        
        // 유효한 값들 중 최대값
        if let maxVal = maxHeap.remove() {
            countDict[maxVal]! -= 1
            
            if countDict[maxVal] == 0 {
                countDict.removeValue(forKey: maxVal)
            }
        }
    }
    
    mutating func removeMin() {
        while let minVal = minHeap.peek(), countDict[minVal] == nil {
            _ = minHeap.remove()
        }
        
        if let minVal = minHeap.remove() {
            countDict[minVal]! -= 1
            
            if countDict[minVal] == 0 {
                countDict.removeValue(forKey: minVal)
            }
        }
    }
    
    mutating func result() {
        while let maxVal = maxHeap.peek(), countDict[maxVal] == nil {
            _ = maxHeap.remove()
        }
        
        while let minVal = minHeap.peek(), countDict[minVal] == nil {
            _ = minHeap.remove()
        }
        
        if let maxVal = maxHeap.peek(), let minVal = minHeap.peek() {
            print("\(maxVal) \(minVal)")
        } else {
            print("EMPTY")
        }
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var pq = DualPriorityQueue()

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ")
        let (cmd, num) = (String(input[0]), Int(input[1])!)
        
        if cmd == "I" {
            pq.insert(num)
        } else if cmd == "D" && num == 1 {
            pq.removeMax()
        } else if cmd == "D" && num == -1 {
            pq.removeMin()
        }
    }
    
    pq.result()
}
