import Foundation

// 22. Generate Parentheses
// https://leetcode.com/problems/generate-parentheses

// MARK: - Solution
// ================
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 { return [] }
        
        var res = [String]()
        
        generateParenthesis(&res, "", 0, 0, n)
        return res
    }
    
    func generateParenthesis(_ res: inout [String], _ s: String, _ left: Int, _ right: Int, _ max: Int)
    {
        if max == 0 { return }
        if s.count == 2 * max {
            res.append(s)
        }
        
        if left < max {
            generateParenthesis(&res, s+"(", left+1, right, max)
        }
        
        if right < left {
            generateParenthesis(&res, s+")", left, right+1, max)
        }
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.generateParenthesis(3), ["((()))", "(()())", "(())()", "()(())", "()()()"])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.generateParenthesis(1), ["()"])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.generateParenthesis(0), [])
    }
}

Tests.defaultTestSuite.run()
