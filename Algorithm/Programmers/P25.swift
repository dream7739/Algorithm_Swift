//
//  main.swift
//  Algorithm
//
//  Created by 홍정민 on 3/14/25.
//

import Foundation

// 영어 끝말잇기

// 몇번째 사람이, 몇번째 차례에 탈락하는지
// 탈락하지 않는다면 [0, 0] 리턴
func solution(_ n:Int, _ words:[String]) -> [Int] {
    var history: [String: Bool] = [:]
    history[words[0]] = true
    
    for i in 1..<words.count {
        // 앞 사람 단어 끝이랑 다르면 무조건 탈락
        if words[i].first! != words[i - 1].last! {
            return [i % n + 1, i / n + 1]
        }
        
        // 언급된 단어를 다시 언급했을 시 탈락
        if let _ = history[words[i]] {
            return [i % n + 1, i / n + 1]
        }
        
        // 위의 사항에 해당이 안되면 인덱스를 저장
        history[words[i]] = true
    }
    
    return [0, 0]
}

print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))
print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
