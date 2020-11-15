import Foundation

// 392. Is Subsequence
// https://leetcode.com/problems/is-subsequence

// MARK: - Solution
// ================
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count > 0 else { return true }
        let s = s.map{ $0 }
        var index = 0

        for char in t {
            if char == s[index] {
                index += 1
                if index == s.count { return true }
            }
        }

        return false
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.isSubsequence("abc", "ahbgdc"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isSubsequence("axc", "ahbgdc"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isSubsequence("", ""))
    }
}

Tests.defaultTestSuite.run()

