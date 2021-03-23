import Foundation

// 58. Length of Last Word
// https://leetcode.com/problems/length-of-last-word

// MARK: - Solution
// ================
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let words = s.split(separator: " ")
        return words.last?.count ?? 0
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample() {
        XCTAssertEqual(s.lengthOfLastWord("Hello World"), 5)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.lengthOfLastWord(""), 0)
    }
}

Tests.defaultTestSuite.run()
