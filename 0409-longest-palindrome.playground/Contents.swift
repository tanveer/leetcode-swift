import Foundation

// 409. Longest Palindrome
// https://leetcode.com/problems/longest-palindrome

// MARK: - Solution
// ================
class Solution {
    func longestPalindrome(_ s: String) -> Int {

        let charCounts = s.reduce(into: [:]) { dict, char in
            dict[char, default: 0] += 1
        }

        var result = 0
        var isOdd = false // keep track of the odd value

        for (_, count) in charCounts {
            if count % 2 == 0 {
                result += count
            } else {
                isOdd = true
                result += count - 1
            }
        }

        if isOdd{ result += 1}

        return result
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
        XCTAssertEqual(s.longestPalindrome("abccccdd"), 7)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.longestPalindrome("a"), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.longestPalindrome("bb"), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.longestPalindrome(""), 0)
    }
}

Tests.defaultTestSuite.run()

