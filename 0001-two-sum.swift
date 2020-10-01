//
//  01-two-sum.swift
//  
//
//  Created by Tanveer Bashir on 9/28/20.
//

import Foundation

// 1. Two Sum
// https://leetcode.com/problems/two-sum

// MARK: - Solution
// ================
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indices: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            if let index = indices[(target - num)] {
                return [index, i]
            } else {
                indices[num] = i
            }
        }
        return []
    }
}

// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(__REPLACE_ME__)
// Explanation: __REPLACE_ME__
//
// Space Complexity: O(__REPLACE_ME__)
// Explanation: __REPLACE_ME__

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExamples() {
        XCTAssertEqual(s.twoSum([2, 7, 11, 15], 9), [0, 1])  // 2 + 7 = 9
        XCTAssertEqual(s.twoSum([3, 2, 4], 6), [1, 2])  // 2 + 4 = 6
        XCTAssertEqual(s.twoSum([3, 3], 6), [0, 1])  // 3 + 3 = 6
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.twoSum([0, 0], 0), [0, 1])  // 0 + 0 = 0
        XCTAssertEqual(s.twoSum([1, 2, 3, 4], 7), [2, 3])  // 3 + 4 = 7
        XCTAssertEqual(s.twoSum([-1, -2, -3], -4), [0, 2])  // -1 + -3 = -4
    }
}

Tests.defaultTestSuite.run()
