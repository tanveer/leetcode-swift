//
//  0013-roman-integer.swift
//  
//
//  Created by Tanveer Bashir on 9/30/20.
//
import Foundation

// 13. Roman to Integer
// https://leetcode.com/problems/roman-to-integer


// MARK: - Solution
// ================
class Solution {
    func romanToInt(_ s: String) -> Int {
        var ans = 0
        let originalStr = Array(s.uppercased()) // uppercased to count for lowercase input
        var previousValue = 0
        let values = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

        for char in originalStr {
            if let value = values[String(char)] {
                if value > previousValue {
                    ans += value - (previousValue * 2)
                } else {
                    ans += value
                }
                previousValue = value
            }
        }
        return ans
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
        XCTAssertEqual(s.romanToInt("III"), 3)
        XCTAssertEqual(s.romanToInt("IV"), 4)
        XCTAssertEqual(s.romanToInt("IX"), 9)
        XCTAssertEqual(s.romanToInt("LVIII"), 58)
        XCTAssertEqual(s.romanToInt("MCMXCIV"), 1994)
    }

    // Additional Examples
    func testAdditionalExamples() {
        // Add your own examples here
    }
}

Tests.defaultTestSuite.run()
