//
//  0038-count-and-say.swift
//  
//
//  Created by Tanveer Bashir on 10/7/20.
//

// 38. Count And Say
// https://leetcode.com/problems/count-and-say/

// MARK: - Solution
// ================
class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        var res = ["1"]
        var n = n
        
        while n > 1 {
            var str = ""
            var index = 0
            while index < res.count {
                var count = 1
                while index + 1 < res.count && res[index] == res[index + 1]{
                    index += 1
                    count += 1
                }
                str += "\(count)\(res[index])"
                index += 1
            }
            res = str.map { "\($0)" }
            n -= 1
        }
        let str = res.map{ "\($0)" }.joined(separator: "")
        return str
    }
}
