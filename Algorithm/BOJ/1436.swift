//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/12/25.
//

import Foundation

// 1436 영화감독 숌
let n = Int(readLine()!)!

var start = 666
var cnt = 0

while true {
    var temp = start
    var six = 0
    
    while temp > 0 {
        if temp % 10 == 6 {
            six += 1
            
            if six == 3 {
                cnt += 1
                break
            }
        } else {
            six = 0
        }
        temp /= 10
    }
    
    if cnt == n {
        print(start)
        break
    }
    
    start += 1
}
