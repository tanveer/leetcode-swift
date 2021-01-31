import Foundation

// 796. Rotate String
// https://leetcode.com/problems/rotate-string

// MARK: - Solution
// ================
class Solution {
    func rotateString(_ A: String, _ B: String) -> Bool {
        return (A + A).contains(B)
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.rotateString("abcde", "cdeab"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.rotateString("abcde", "abced"))
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertTrue(s.rotateString("", ""))
    }

    func testLeetCodeTest2() {
        XCTAssertTrue(s.rotateString("a", "aa"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.rotateString("abcde", "cdeab"))
    }
}

Tests.defaultTestSuite.run()
