import Foundation

// 79. Word Search
// https://leetcode.com/problems/word-search

// MARK: - Solution
// ================
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == word[0] && dfs(board, i, j, 0, word) {
                    return true
                }
            }
        }

        return false
    }

    func dfs(_ board: [[Character]], _ i: Int, _ j: Int, _ count: Int, _ word: [Character]) -> Bool {
        if count == word.count {
            return true
        }
        var board = board

        if i < 0 || i >= board.count || j < 0 || j >= board[i].count || board[i][j] != word[count] {
            return false
        }

        let char = board[i][j]
        board[i][j] = " "

        let found = dfs(board, i + 1, j, count + 1, word)
            || dfs(board, i - 1, j, count + 1, word)
            || dfs(board, i, j + 1, count + 1, word)
            || dfs(board, i, j - 1, count + 1, word)
        board[i][j] = char

        return found
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n+m)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    func testLeetcodeExample1() {
        XCTAssertTrue(s.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCCED"))
    }

    func testLeetcodeExamples2() {
        XCTAssertTrue(s.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "SEE"))
    }

    func testLeetcodeExamples3() {
        XCTAssertFalse(s.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCB"))
    }
}

Tests.defaultTestSuite.run()
