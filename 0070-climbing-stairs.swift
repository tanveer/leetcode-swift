//
//  0070-climbing-stairs.swift
//  
//
//  Created by Tanveer Bashir on 10/10/20.
//
// 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/

// MARK: - Solution
// ================
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 { return n }
        
        var stairs = [Int](repeating: 0, count: n + 1)
        stairs[1] = 1
        stairs[2] = 2
        
        for i in stride(from: 3, through: n, by: 1) {
            stairs[i] = stairs[i-1] + stairs[i-2]
        }
        return stairs[n]
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.climbStairs(2), 2)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.climbStairs(3), 3)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.climbStairs(0), 0)
        XCTAssertEqual(s.climbStairs(44), 1134903170)
    }
}

Tests.defaultTestSuite.run()
