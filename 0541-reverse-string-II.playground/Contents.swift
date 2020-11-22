import Foundation

// 541. Reverse String II
// https://leetcode.com/problems/reverse-string-ii

// MARK: - Solution
// ================
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        if s.isEmpty { return "" }
        var startIndex = 0
        var chars = Array(s)

        while startIndex < chars.count {
            var i = startIndex
            var j = (startIndex + k) > chars.count ? chars.count - 1 : (startIndex + k)-1

            while i < j {
                let char: Character = chars[i]
                chars[i] = chars[j]
                chars[j] = char
                i += 1
                j -= 1
            }
            startIndex += (2 * k)
        }

        return String(chars)
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.reverseStr("abcdefg", 2), "bacdfeg")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.reverseStr("", 0), "")
    }
}

Tests.defaultTestSuite.run()
