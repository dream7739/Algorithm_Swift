//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 9/7/25.
//

import Foundation

// 9017 크로스 컨트리

// 1. 한 팀은 여섯명, 팀 점수는 상위 네명의 점수의 합
// 2. 가장 적은 점수를 가진 팀이 우승, 동점인 경우에는 다섯번째 주자가 가장 빨리 들어온 팀이 우승
// 3. 여섯명의 주자가 참가하지 못한팀은 점수 계산 제외

let count = Int(readLine()!)!

for _ in 0..<count {
    let _ = Int(readLine()!)
    let teams = readLine()!.split(separator: " ").map { Int($0)! }
    
    // 1. 탈락 팀 찾기 위해 멤버 카운팅
    // 2. 출전 횟수 = 멤버 수
    var memberCount = [Int: Int]()
    for team in teams {
        memberCount[team, default: 0] += 1
    }
    
    // 3. 멤버 수가 6보다 작은 팀을 제외
    var validTeams = Set<Int>()
    for (team, cnt) in memberCount {
        if cnt >= 6 {
            validTeams.insert(team)
        }
    }
    
    // 4. 유효 팀 만으로 순위 기록
    var rank: [Int: [Int]] = [:]
    var score = 1
    for team in teams {
        if validTeams.contains(team) {
            rank[team, default: []].append(score)
            score += 1
        }
    }
    
    var winner = 0
    var minSum = Int.max
    var minFifth = Int.max
    
    // 5. 우승팀 판별
    for team in validTeams {
        // 팀별 점수
        let ranks = rank[team]!
        let sum = ranks[0] + ranks[1] + ranks[2] + ranks[3]
        let fifth = ranks[4]
        
        if sum < minSum || (sum == minSum && fifth < minFifth) {
            minSum = sum
            minFifth = fifth
            winner = team
        }
    }
    
    print(winner)
}

