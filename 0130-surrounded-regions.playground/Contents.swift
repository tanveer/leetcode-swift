import Foundation

// 130. Surrounded Regions
// https://leetcode.com/problems/surrounded-regions

// MARK: - Solution
// ================
class Solution {
    func solve(_ board: inout [[Character]]) {
        for row in board.indices {
            for col in board[row].indices where board[row][col] == "O"{
                var currBoard = board
                if validRegionBoardDFS(&currBoard, row, col) {
                    board = currBoard
                }
            }
        }
    }

    func validRegionBoardDFS(_ grid: inout [[Character]], _ row: Int, _ col: Int) -> Bool {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[row].count {
            return false
        }

        if grid[row][col] != "O" {
            return true
        }
        grid[row][col] = "X"

        for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
            let newRow = row + dx
            let newCol = col + dy
            let isValid = validRegionBoardDFS(&grid, newRow, newCol)
            if !isValid {
                return false
            }
        }
        return true
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n x m)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    // LeetCode Examples
    func testLeetCodeExample1() {
        var board: [[Character]] = [
            ["X", "X", "X", "X"],
            ["X", "O", "O", "X"],
            ["X", "X", "O", "X"],
            ["X", "O", "X", "X"],
        ]

        let expected: [[Character]] = [
            ["X", "X", "X", "X"],
            ["X", "X", "X", "X"],
            ["X", "X", "X", "X"],
            ["X", "O", "X", "X"],
        ]
        s.solve(&board)
        XCTAssertEqual(board, expected)
    }
    // Additional Examples
    func testAdditionalExamples() {
        var board: [[Character]] = []
        s.solve(&board)
        XCTAssertEqual(board, [])
    }
}

Tests.defaultTestSuite.run()
