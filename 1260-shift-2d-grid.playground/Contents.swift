import Foundation

// 1260. Shift 2D Grid
// https://leetcode.com/problems/shift-2d-grid

// MARK: - Solution
// ================
class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        guard !grid.isEmpty else { return [] }
        var shiftedGrid = grid
        let row = grid.count
        let col = grid[0].count
        for r in 0..<row {
            for c in 0..<col {
                let index = (((r * col) + c) + k) % (row * col)
                let kRow = index / col
                let kCol = index % col
                shiftedGrid[kRow][kCol] = grid[r][c]
            }
        }
        return shiftedGrid
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m + n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.shiftGrid([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 1), [[9, 1, 2], [3, 4, 5], [6, 7, 8]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.shiftGrid([[3, 8, 1, 9], [19, 7, 2, 5], [4, 6, 11, 10], [12, 0, 21, 13]], 4), [[12, 0, 21, 13], [3, 8, 1, 9], [19, 7, 2, 5], [4, 6, 11, 10]])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.shiftGrid([[1, 2, 3], [4, 5, 6], [7, 8, 9]], 9), [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    }
}

Tests.defaultTestSuite.run()
