////
////  main.swift
////  Algorithm
////
////  Created by 홍정민 on 2/26/25.
////
//
//import Foundation
//
//// DFS (깊이 우선 탐색)
//
//var graph = [
//    [],
//    [2, 3, 8], // 1-2-3-8 연결
//    [1, 7],
//    [1, 4, 5],
//    [3, 5],
//    [3, 4],
//    [7],
//    [2, 6, 8],
//    [1, 7]
//]
//
//// 9 * 9
//var visited = Array.init(
//    repeating: false,
//    count: 9
//)
//
//var stack = Stack<Int>()
//
//struct Stack<T> {
//    private var array: [T] = []
//    
//    var peek: T? {
//        return array.last
//    }
//    
//    var isEmpty: Bool {
//        return array.isEmpty
//    }
//    
//    var count: Int {
//        return array.count
//    }
//    
//    mutating func push(_ element: T) {
//        array.append(element)
//    }
//    
//    mutating func pop() -> T? {
//        return array.popLast()
//    }
//}
//
//func DFS(graph: [[Int]], v: Int, visited: inout [Bool]) {
//    visited[v] = true
//    stack.push(v)
//    print(v)
//    
//    for i in graph[v] {
//        if !visited[i] {
//            stack.push(i)
//            DFS(graph: graph, v: i, visited: &visited)
//        }
//    }
//    
//}
//
//// 1번 노드부터 방문
//DFS(graph: graph, v: 1, visited: &visited)
