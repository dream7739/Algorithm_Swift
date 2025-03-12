//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/12/25.
//

import Foundation

// 문자열 내 p와 y의 개수

func solution1(_ s:String) -> Bool
{
    let str = s.lowercased()
    let np = str.filter { $0 == "p" }.count
    let ny = str.filter { $0 == "y" }.count

    return np == ny
}

func solution2(_ s:String) -> Bool
{
    let str = s.lowercased()
    return str.components(separatedBy: "p").count == str.components(separatedBy: "y").count
}

print(solution1("pPoooyY"))
print(solution2("Pyy"))
