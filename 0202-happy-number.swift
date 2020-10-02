#!/usr/bin/env swift -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks

//  0202-happy-number.swift
//  
//
//  Created by Tanveer Bashir on 10/2/20.
//

// 202. Happy Number
// https://leetcode.com/problems/happy-number

// MARK: - Solution
// ================
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visited = [Int: Bool]()
        var value = n
        
        while value != 1 {
            if visited[value] != nil {
                // checking to see if value is already visited return false because value will never be == 1
                return false
            }
            visited[value] = true // set visited value to true for tracking
            
            let digits = String(value).map { Int(String($0))!}
            var num = 0
            for digit in digits {
                num += digit * digit
            }
            value = num // update value to run the loop again if value == 1 break out of the loop
        }
        return value == 1
    }
}

// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(n)
// Explanation: Depends on the size of input
//
// Space Complexity: O(n)
// Explanation: Sotrage is required to keep track of the n value

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExamples() {
        XCTAssertTrue(s.isHappy(19))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        // Add your own examples here
    }
}

Tests.defaultTestSuite.run()
