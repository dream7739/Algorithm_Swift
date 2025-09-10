//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/9/25.
//

import Foundation

// 20546 기적의 매매법

// 준현이의 자산이 더 클 경우: BNP
// 성민이의 자산이 더 클 경우: TIMING
// 같을 경우: SAMESAME

// 자산: (현금 + 1월 14일의 주가 × 주식 수)
// 준현
// 현금 보유 내에서 주식을 살 수 있으면 무조건 많이 삼
// 성민
// 3일 연속 오르면, 다음날 전량 매도
// 3일 연속 내리면, 다음날 전량 매수

let money = Int(readLine()!)!
let stockPrice = readLine()!.split(separator: " ").map { Int($0)! }

var budgetA = money
var stockA = 0

var budgetB = money
var stockB = 0

var isIncrease = false
var isDecrease = false

for i in 0..<stockPrice.count {
    let price = stockPrice[i]
    
    // 준현
    if budgetA >= price {
        let buy = budgetA / stockPrice[i]
        budgetA -= (buy * price)
        stockA += buy
    }
    
    // 성민
    if i >= 3 {
        let last3 = Array(stockPrice[(i-3)..<i])
        if last3[0] < last3[1] && last3[1] < stockPrice[2], stockB > 0 {
            budgetB += stockB * price
            stockB = 0
        } else if last3[0] > last3[1] && last3[1] > last3[2], budgetB >= price {
            let buy = budgetB / price
            budgetB -= (buy * price)
            stockB += buy

        }
    }
}

let lastStockPrice = stockPrice.last!
let assetA = budgetA + lastStockPrice * stockA
let assetB = budgetB + lastStockPrice * stockB

if assetA > assetB {
    print("BNP")
} else if assetA < assetB {
    print("TIMING")
} else {
    print("SAMESAME")
}
