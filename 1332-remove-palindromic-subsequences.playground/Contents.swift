import Foundation

// 1332. Remove Palindromic Subsequences
// https://leetcode.com/problems/remove-palindromic-subsequences

// MARK: - Solution
// ================
class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        if isPalindrome(s) {
            return 1
        }
        return 2
    }

    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var leftIndex = 0
        var rightIndex = chars.count - 1

        while leftIndex < rightIndex {
            let leftChar = chars[leftIndex]
            let rightChar = chars[rightIndex]
            if leftChar != rightChar {
                return false
            } else {
                leftIndex += 1
                rightIndex -= 1
            }
        }

        return true
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
        XCTAssertEqual(s.removePalindromeSub("ababa"), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.removePalindromeSub("abb"), 2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.removePalindromeSub("baabb"), 2)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.removePalindromeSub(""), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.removePalindromeSub(""), 0)
    }
}

Tests.defaultTestSuite.run()
