import Foundation

// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix

// MARK: - Solution
// ================
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var prefix = strs.first ?? ""

        for word in strs {
            while !word.hasPrefix(prefix) {
                prefix.removeLast()
            }
        }
        return prefix
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
        XCTAssertEqual(s.longestCommonPrefix(["flower", "flow", "flight"]), "fl")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.longestCommonPrefix(["dog", "racecar", "car"]), "")
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.longestCommonPrefix(["a"]), "a")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.longestCommonPrefix([]), "")
    }
}

Tests.defaultTestSuite.run()
