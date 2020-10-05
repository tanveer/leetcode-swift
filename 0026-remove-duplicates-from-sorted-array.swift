
//
//  0026-remove-duplicates-from-sorted-array.swift
//
//
//  Created by Tanveer Bashir on 10/5/20.
//

// 26. Remove Duplicates from Sorted Array
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

// MARK: - Solution
// ================
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var index = 0
        for num in nums {
            if (num != nums[index]) {
                index += 1
                nums[index] = num
            }
        }
        return index + 1
    }
}

// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(n)
// Explanation: We need to search each element and insert each element for n times
//
// Space Complexity: O(1)
// Explanation: We only storing index for comparision so it's constant time
// MARK: - Tests
// =============

let nums1 = [0,0,1,1,1,2,2,3,3,4]
let nums = [1,1,2]

import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExamples() {
        XCTAssertTrue(s.removeDuplicates(&nums))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.removeDuplicates(&nums1))
    }
}

Tests.defaultTestSuite.run()
