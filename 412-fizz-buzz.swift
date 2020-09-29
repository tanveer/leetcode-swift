//
//  412-fizz-buzz.swift
//  
//
//  Created by Tanveer Bashir on 9/28/20.
//

import Foundation


//MARK: - FizzBuzz problem #412

// 412. Fizz Buzz
// https://leetcode.com/problems/fizz-buzz
// MARK: - Solution
// ================
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
      var result = [String]()
        for i in 1...n {
          if i % 3 == 0 && i % 5 == 0 {
             result.append("FizzBuzz")
          } else if i % 5 == 0 {
              result.append("Buzz")
          } else if i % 3 == 0 {
              result.append("Fizz")
          } else {
            result.append("\(i)")
          }
        }
      return result
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
