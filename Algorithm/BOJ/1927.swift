//
//  1927.swift
//  Algorithm
//
//  Created by 홍정민 on 9/17/25.
//

import Foundation

// 1927 최소힙
struct MinHeap<T: Comparable> {
    var elements = [T]()
    
    // 부모 인덱스
    func parent(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // 왼쪽 자식 인덱스
    func leftChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    // 오른쪽 자식 인덱스
    func rightChild(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    // 최상단
    func peek() -> T? {
        return elements.last
    }
    
    // 힙 크기
    var size: Int {
        return elements.count
    }
    
    // 삽입 이후, 재조정
    // 가장 왼쪽 리프노드에 신규로 들어온 값을 부모와 비교하였을 때, 부모가 더 큰값이면 변경
    private mutating func swimUp(from index: Int) {
        var index = index
        
        while index > 0 && elements[parent(of: index)] > elements[index] {
            elements.swapAt(index, parent(of: index))
            index = parent(of: index)
        }
    }
    
    // 삭제 이후, 재조정
    // 루트노드부터 하위노드들을 갱신하면서 맞춰주기
    private mutating func diveDown(from index: Int) {
        let left = leftChild(of: index)
        let right = rightChild(of: index)
        
        var smallest = index
        
        // 왼쪽 노드가 더 작을 때
        if left < self.elements.count && elements[left] < elements[smallest] {
            smallest = left
        }
        
        // 오른쪽 노드가 더 작을 때
        if right < self.elements.count && elements[right] < elements[smallest] {
            smallest = right
        }
        
        // 교환이 필요한 경우
        if smallest != index {
            elements.swapAt(smallest, index)
            diveDown(from: smallest)
        }
    }
    
    // 삽입 O(log N)
    // 삽입 이후 트리 재조정
    mutating func insert(_ value: T) {
        elements.append(value)
        swimUp(from: elements.count - 1)
    }
    
    // 삭제 O(log N)
    // 루트 노드에 있는 우선순위가 낮은 노드를 꺼내고, 트리를 재조정
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

// x가 자연수라면 배열에 x를 추가하는 연산
// x가 0이라면 배열에서 가장 작은 값을 출력하는 연산

let n = Int(readLine()!)!
var minHeap = MinHeap<Int>()

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    if input > 0 {
        minHeap.insert(input)
    } else {
        print(minHeap.remove() ?? 0)
    }
}
