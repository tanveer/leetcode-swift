#!/usr/bin/env swift -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks

//
//  0027-remove-element.swift
//  
//
//  Created by Tanveer Bashir on 10/1/20.
//

// 27. Remove Element
// https://leetcode.com/problems/remove-element

// MARK: - Solution
// ================
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0
        for n in nums {
            if n != val {
                nums[index] = n
                index += 1
            }
        }
        return index
    }
}

// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(n)
// Explanation: checking every element in given array is needed.
//
// Space Complexity: O(1)
// Explanation: No additional space

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let examples: [(original: [Int], val: Int, expected: [Int], count: Int)] = [
        // LeetCode Examples
        (
            original: [3, 2, 2, 3],
            val: 3,
            expected: [2, 2, 2, 3],
            count: 2
        ),
        (
            original: [0, 1, 2, 2, 3, 0, 4, 2],
            val: 2,
            expected: [0, 1, 3, 0, 4, 0, 4, 2],
            count: 5
        ),
        // Additional Examples
        (
            original: [2],
            val: 3,
            expected: [2],
            count: 1
        ),
        (
            original: [3, 3],
            val: 3,
            expected: [3, 3],
            count: 0
        ),
        (
            original: [3, 3],
            val: 5,
            expected: [3, 3],
            count: 2
        ),
    ]
    
    func testExamples() {
        for example in examples {
            let (actualCount, actualOutput) = removeElementTestHelper(example.original, example.val)
            XCTAssertEqual(actualCount, example.count, "Failed Example: \(example)")
            XCTAssertEqual(actualOutput, example.expected, "Failed Example: \(example)")
        }
    }
    
    func removeElementTestHelper(_ array: [Int], _ val: Int) -> (Int, [Int]){
        var inoutArray = array
        let newLength = s.removeElement(&inoutArray, val)
        return (newLength, inoutArray)
    }
}

Tests.defaultTestSuite.run()
