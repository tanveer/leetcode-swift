import Foundation

// 289. Game of Life
// https://leetcode.com/problems/game-of-life

// MARK: - Solution
// ================
class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let rowCount = board.count
        let colCount = board[0].count
        let directions = [
            [-1, 0],
            [-1, 1],
            [0, 1],
            [1, 1],
            [1, 0],
            [1, -1],
            [0, -1],
            [-1, -1],
        ]

        for r in stride(from: 0, to: rowCount, by: 1) {
            for c in stride(from: 0, to: colCount, by: 1) {
                var liveCount = 0
                for dir in directions {
                    let x = r + dir[0]
                    let y = c + dir[1]
                    if x >= 0 && x < rowCount && y >= 0 {
                        if y < colCount && board[x][y] >= 1 {
                            liveCount += 1
                        }
                    }
                }

                if board[r][c] >= 1 {
                    if liveCount < 2 || liveCount > 3 {
                        board[r][c] = 2
                    }
                } else {
                    if liveCount == 3 {
                        board[r][c] = -1
                    }
                }
            }
        }

        for r in stride(from: 0, to: rowCount, by: 1) {
            for c in stride(from: 0, to: colCount, by: 1) {
                if board[r][c] == 2 {
                    board[r][c] = 0
                } else if board[r][c] == -1 {
                    board[r][c] = 1
                }
            }
        }
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
        let expected = [
            [0, 0, 0],
            [1, 0, 1],
            [0, 1, 1],
            [0, 1, 0],
        ]
        var inoutInput = [
            [0, 1, 0],
            [0, 0, 1],
            [1, 1, 1],
            [0, 0, 0],
        ]
        s.gameOfLife(&inoutInput)
        XCTAssertEqual(inoutInput, expected)
    }

    func testLeetCodeExample2() {
        let expected = [
            [1, 1],
            [1, 1],
        ]
        var inoutInput = [
            [1, 1],
            [1, 0],
        ]
        s.gameOfLife(&inoutInput)
        XCTAssertEqual(inoutInput, expected)
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [[Int]] = [[1]]
        s.gameOfLife(&inoutInput)
        XCTAssertEqual(inoutInput, [[0]])
    }
}

Tests.defaultTestSuite.run()
