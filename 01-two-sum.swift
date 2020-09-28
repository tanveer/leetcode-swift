//
//  01-two-sum.swift
//  
//
//  Created by Tanveer Bashir on 9/28/20.
//

import Foundation


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indices: [Int: Int] = [:]
        for (i, num ) in nums.enumerated(){
            if let index = indices[(target - num)] {
                return [index , i]
            } else {
                indices[num] = i
            }
        }
        return []
    }
}
