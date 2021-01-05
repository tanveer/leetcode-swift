import Foundation

// 36. Valid Sudoku
// https://leetcode.com/problems/valid-sudoku

// MARK: - Solution
// ================
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var hashSet = Set<String>()
        
        for x in 0..<9 {
            for y in 0..<9 where board[x][y] != "." {
                if !hashSet.insert("\(x)(\(board[x][y]))").inserted ||
                    !hashSet.insert("(\(board[x][y]))\(y)").inserted ||
                    !hashSet.insert("\(x / 3)(\(board[x][y]))\(y / 3)").inserted {
                    return false
                }
            }
        }
        
        return true
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O()
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        let board: [[Character]] = [
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],
            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        XCTAssertEqual(s.isValidSudoku(board), true)
    }
    
    func testLeetCodeExample2() {
        let board: [[Character]] = [
            ["8", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],
            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"],
        ]
        XCTAssertEqual(s.isValidSudoku(board), false)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let board: [[Character]] = [
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "."],
        ]
        XCTAssertEqual(s.isValidSudoku(board), true)
    }
}

Tests.defaultTestSuite.run()
