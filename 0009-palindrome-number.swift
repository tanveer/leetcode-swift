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
        var x = x
        if x < 0 || x % 10 == 0 && x != 0 { return false }

        var reversed = 0

        while x > reversed {
            reversed = reversed * 10 + x % 10
            if reversed == x {return true}
            x = Int(x / 10)
        }
        return reversed == x
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

