import Foundation

// 1351. Count Negative Numbers in a Sorted Matrix
// https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix

// MARK: - Solution
// ================
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return 0 }

        let rowCount = grid.count
        let colCount = grid[0].count

        var row = rowCount - 1
        var col = 0
        var total = 0

        while row >= 0, col < colCount {
            if grid[row][col] < 0 {
                row -= 1
                total += (colCount - col)
            } else {
                col += 1
            }
        }

        return total
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m + n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.countNegatives([[4, 3, 2, -1], [3, 2, 1, -1], [1, 1, -1, -2], [-1, -1, -2, -3]]), 8)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.countNegatives([[3, 2], [1, 0]]), 0)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.countNegatives([[1, -1], [-1, -1]]), 3)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.countNegatives([[-1]]), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.countNegatives([]), 0)
    }
}

Tests.defaultTestSuite.run()
