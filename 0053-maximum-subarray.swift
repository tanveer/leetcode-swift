//
//  0053-maximum-subarray.swift
//  
//
//  Created by Tanveer Bashir on 10/8/20.
//

// 53. Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/

// MARK: - Solution
// ================
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return nums.count }
        
        var current = nums.first ?? 0
        var maxSum = current
        
        for i in 1..<nums.count {
            current = max(nums[i], current + nums[i])
            maxSum = max(current, maxSum)
        }
        return maxSum
    }
}
