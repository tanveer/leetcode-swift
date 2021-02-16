import Foundation

// 806. Number of Lines To Write String
// https://leetcode.com/problems/number-of-lines-to-write-string

// MARK: - Solution
// ================
class Solution {
    func numberOfLines(_ widths: [Int], _ S: String) -> [Int] {
        guard !S.isEmpty else { return [0, 0] }

        var linesCount = 1
        var lastLineLength = 0
        let value = Character("a").asciiValue!

        for char in S {
            let index = Int(char.asciiValue ?? value) - Int(value)
            if lastLineLength + widths[index] > 100 {
                linesCount += 1
                lastLineLength = widths[index]
            } else {
                lastLineLength += widths[index]
            }
        }

        return [linesCount, lastLineLength]
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
        XCTAssertEqual(s.numberOfLines([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], "abcdefghijklmnopqrstuvwxyz"), [3, 60])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numberOfLines([4, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], "bbbcccdddaaa"), [2, 4])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numberOfLines([], ""), [0, 0])
    }
}

Tests.defaultTestSuite.run()
