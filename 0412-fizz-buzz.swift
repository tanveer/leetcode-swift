//
//  412-fizz-buzz.swift
//  
//
//  Created by Tanveer Bashir on 9/28/20.
//

import Foundation

// 412. Fizz Buzz
// https://leetcode.com/problems/fizz-buzz

// MARK: - Solution
// ================
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        var strings = [String]()
        
        for i in 1...n {
            if i % 3 == 0 && i % 5 == 0 {
                strings.append("FizzBuzz")
            } else if i % 5 == 0 {
                strings.append("Buzz")
            } else if i % 3 == 0 {
                strings.append("Fizz")
            } else {
                strings.append("\(i)")
            }
        }
        return strings
    }
}


// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(n)
// Explanation: Becasue we have to run the loop for the size of the input value
//
// Space Complexity: O(n)
// Explanation: Output array size is same as the size of input value


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExamples() {
        let expected = [
            "1",
            "2",
            "Fizz",
            "4",
            "Buzz",
            "Fizz",
            "7",
            "8",
            "Fizz",
            "Buzz",
            "11",
            "Fizz",
            "13",
            "14",
            "FizzBuzz"
        ]
        XCTAssertEqual(s.fizzBuzz(15), expected)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.fizzBuzz(0), [])
        XCTAssertEqual(s.fizzBuzz(1), ["1"])
    }
}

Tests.defaultTestSuite.run()
