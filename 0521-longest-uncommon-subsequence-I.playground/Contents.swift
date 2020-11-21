import Foundation

// 521. Longest Uncommon Subsequence I
// https://leetcode.com/problems/longest-uncommon-subsequence-i

// MARK: - Solution
// ================
class Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        return a == b ? -1 : max(a.count, b.count)
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
        XCTAssertEqual(s.findLUSlength("aba", "cdc"), 3)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findLUSlength("aaa", "bbb"), 3)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.findLUSlength("aaa", "aaa"), -1)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findLUSlength("", ""), 0)
    }
}

Tests.defaultTestSuite.run()
