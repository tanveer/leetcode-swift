import Foundation

// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring

// MARK: - Solution
// ================
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var longest = 0
        var left = 0
        var right = -1
        let chars = Array(s)

        for i in 0..<chars.count {
            for j in 0..<2 {
                let (count, l, r) = longestPalindrome(chars, i, i + j)
                if count > longest {
                    longest = count
                    left = l
                    right = r
                }
            }
        }

        return String(chars[left...right])
    }

    func longestPalindrome(_ chars: [Character], _ l: Int, _ r: Int) -> (Int, Int, Int) {
        var left = l
        var right = r

        while left >= 0 && right < chars.count && chars[left] == chars[right] {
            left -= 1
            right += 1
        }

        left += 1
        right -= 1
        let count = right - left + 1

        return (count, left, right)
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
        XCTAssertEqual(s.longestPalindrome("babad"), "bab")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.longestPalindrome("cbbd"), "bb")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.longestPalindrome("a"), "a")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.longestPalindrome("ac"), "a")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.longestPalindrome("racecar"), "racecar")
    }
}

Tests.defaultTestSuite.run()
