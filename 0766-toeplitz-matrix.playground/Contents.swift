import Foundation

// 766. Toeplitz Matrix
// https://leetcode.com/problems/toeplitz-matrix

// MARK: - Solution
// ================
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        var map = [Int: Int]()
        for (i, row) in matrix.enumerated() {
            for j in row.indices {
                if map[i - j] == nil {
                    map[i - j] = matrix[i][j]
                } else if map[i - j]! != matrix[i][j] {
                    return false
                }
            }
        }
        return true
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n+m)
// Space Complexity: O(n+m)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let matrix = [
            [1, 2, 3, 4],
            [5, 1, 2, 3],
            [9, 5, 1, 2],
        ]
        XCTAssertTrue(s.isToeplitzMatrix(matrix))
    }

    func testLeetCodeExample2() {
        let matrix = [
            [1, 2],
            [2, 2],
        ]
        XCTAssertFalse(s.isToeplitzMatrix(matrix))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isToeplitzMatrix([]))
    }
}

Tests.defaultTestSuite.run()
