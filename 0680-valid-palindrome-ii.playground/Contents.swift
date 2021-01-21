import Foundation

// 680. Valid Palindrome II
// https://leetcode.com/problems/valid-palindrome-ii

// MARK: - Solution
// ================
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = [Character](s)
        var left = 0
        var right = chars.count - 1

        while left <= right {
            if chars[left] != chars[right] {
                return isPalindrome(chars, left, right - 1) || isPalindrome(chars, left + 1, right)
            }

            left += 1
            right -= 1
        }
        return true
    }

    func isPalindrome(_ chars: [Character], _ right: Int, _ left: Int) -> Bool {
        var right = right
        var left = left
        while right < left {
            if chars[right] != chars[left] {
                return false
            }

            right += 1
            left -= 1
        }

        return true
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
        XCTAssertTrue(s.validPalindrome("aba"))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.validPalindrome("abca"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.validPalindrome(""))
    }
}

Tests.defaultTestSuite.run()
