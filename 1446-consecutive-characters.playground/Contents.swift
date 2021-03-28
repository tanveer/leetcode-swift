import Foundation

// 1446. Consecutive Characters
// https://leetcode.com/problems/consecutive-characters

// MARK: - Solution
// ================
class Solution {
    func maxPower(_ s: String) -> Int {
        var prevChar: Character = "-"
        var count = 0
        var maxCount = 0

        for char in s {
            if char == prevChar {
                count += 1
            } else {
                prevChar = char
                count = 1
            }
            maxCount = max(maxCount, count)
        }
        return maxCount
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
        XCTAssertEqual(s.maxPower("leetcode"), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxPower("abbcccddddeeeeedcba"), 5)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxPower("triplepillooooow"), 5)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.maxPower("hooraaaaaaaaaaay"), 11)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.maxPower("tourist"), 1)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.maxPower("cc"), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxPower(""), 0)
    }
}

Tests.defaultTestSuite.run()
