import Foundation

// 125. Valid Palindrome
// https://leetcode.com/problems/valid-palindrome

// MARK: - Solution
// ================
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let charsOnly = s.lowercased().filter { $0.isLetter || $0.isNumber }
        let chars = [Character](charsOnly)
        var leftIndex = 0
        var rightIndex = chars.count - 1

        while leftIndex < rightIndex {
            if chars[leftIndex] != chars[rightIndex] {
                return false
            }
            leftIndex += 1
            rightIndex -= 1
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
        XCTAssertTrue(s.isPalindrome("A man, a plan, a canal: Panama"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isPalindrome("race a car"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isPalindrome(""))
    }
}

Tests.defaultTestSuite.run()
