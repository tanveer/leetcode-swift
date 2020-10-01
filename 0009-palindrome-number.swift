//
//  0009-palindrome-number.swift
//  
//
//  Created by Tanveer Bashir on 9/29/20.
//

// 9. Palindrome Number
// https://leetcode.com/problems/palindrome-number

// MARK: - Solution
// ================
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var original = x
        var reversed = 0
        
        while original > 0 {
            let onesDigit = original % 10
            reversed = (reversed * 10) + onesDigit
            original /= 10
        }
        
        return x == reversed
    }
}

// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(n)
// Explanation: Checking the size on the input value
//
// Space Complexity: O(1)
// Explanation: Only var is used to stoe the answer

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExamples() {
        XCTAssertTrue(s.isPalindrome(121))
        XCTAssertTrue(s.isPalindrome(-121))  // No because "-121" != "121-"
        XCTAssertTrue(s.isPalindrome(10))  // No because - "10" != "01"
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isPalindrome(12321))
    }
}

Tests.defaultTestSuite.run()
