//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/13/25.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var x = 3
    
    while true {
        for y in 1...x {
            let total = x * y
            let ny = (x - 2) * (y - 2)
            let nb = total - ny
            
            if brown == nb && ny == yellow {
                return [x, y]
            }
        }
        x += 1
    }
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))
