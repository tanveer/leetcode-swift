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
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard !nums.isEmpty else { return 0 }
    var index = 0
    
    for (j, _ ) in nums.enumerated() {
        if nums[j] != val {
            nums[index] = nums[j]
            index += 1
        }
    }
    return index
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
            let (actualCount, actualOutput) = inoutTestHelper(example.original, example.val)
            XCTAssertEqual(actualCount, example.count, "Failed Example: \(example)")
            XCTAssertEqual(actualOutput, example.expected, "Failed Example: \(example)")
        }
    }

    func inoutTestHelper(_ array: [Int], _ val: Int) -> (Int, [Int]){
        var inoutArray = array
        let newLength = s.testRemoveElement(&inoutArray, val)
        return (newLength, inoutArray)
    }
}

Tests.defaultTestSuite.run()
