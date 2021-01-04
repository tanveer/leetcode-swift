import Foundation

// 832. Flipping an Image
// https://leetcode.com/problems/flipping-an-image

// MARK: - Solution
// ================
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        guard !A.isEmpty else { return [] }
        var grid = A
        
        for (r, row) in grid.enumerated() {
            for (c, num) in row.reversed().enumerated() {
                grid[r][c] = num ^ 1
            }
        }

        return grid
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
        XCTAssertEqual(s.flipAndInvertImage([[1, 1, 0], [1, 0, 1], [0, 0, 0]]), [[1, 0, 0], [0, 1, 0], [1, 1, 1]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.flipAndInvertImage([[1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0]]), [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0]])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.flipAndInvertImage([]), [])
    }
}

Tests.defaultTestSuite.run()

