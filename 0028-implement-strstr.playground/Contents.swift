import Foundation

// 28. Implement strStr()
// https://leetcode.com/problems/implement-strstr

// MARK: - Solution
// ================
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }

        let needle = Array(needle)
        let haystack = Array(haystack)
        var p1 = 0
        var p2 = 0

        while p1 < haystack.count {
            if haystack[p1] == needle[p2] {
                p2 += 1
                print("p2: ", p2)
            } else {
                p1 -= p2
                p2 = 0
            }
            p1 += 1
            print("P1: ", p1)

            if p2 == needle.count {
                return p1 - p2
            }
        }
        return -1
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)

// MARK: - Tests
    // =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.strStr("hello", "ll"), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.strStr("aaaaa", "bba"), -1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.strStr("", ""), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.strStr("a", "a"), 0)
        XCTAssertEqual(s.strStr("aaaa", "a"), 0)
        XCTAssertEqual(s.strStr("abbb", "b"), 1)
    }
}

Tests.defaultTestSuite.run()
