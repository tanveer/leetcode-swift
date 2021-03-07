import Foundation

// 240. Search a 2D Matrix II
// https://leetcode.com/problems/search-a-2d-matrix-ii

// MARK: - Solution
// ================
class Solution1 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = 0
        var col = matrix[row].count - 1

        while row < matrix.count, col >= 0 {
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] > target {
                col -= 1
            } else {
                row += 1
            }
        }

        return false
    }
}

class Solution2 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for row in 0..<matrix.count {
            for col in 0..<matrix[row].count where matrix[row][col] == target {
                return true
            }
        }
        return false
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2) using nested for loops
// Time Complexity: O(log(n))  with Solution 1
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let matrix = [
            [1, 4, 7, 11, 15],
            [2, 5, 8, 12, 19],
            [3, 6, 9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30],
        ]
        XCTAssertTrue(s1.searchMatrix(matrix, 5))
        XCTAssertTrue(s2.searchMatrix(matrix, 5))
    }

    func testLeetCodeExample2() {
        let matrix = [
            [1, 4, 7, 11, 15],
            [2, 5, 8, 12, 19],
            [3, 6, 9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30],
        ]
        XCTAssertFalse(s1.searchMatrix(matrix, 20))
        XCTAssertFalse(s2.searchMatrix(matrix, 20))
    }

    // Additional Examples
    func testAdditionalExamples() {
        let matrix = [
            [1, 4, 7, 11, 15],
            [2, 5, 8, 12, 19],
            [3, 6, 9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30],
        ]

        // Corners
        XCTAssertTrue(s1.searchMatrix(matrix, 1))
        XCTAssertTrue(s2.searchMatrix(matrix, 1))
        XCTAssertTrue(s1.searchMatrix(matrix, 15))
        XCTAssertTrue(s2.searchMatrix(matrix, 15))
        XCTAssertTrue(s1.searchMatrix(matrix, 30))
        XCTAssertTrue(s2.searchMatrix(matrix, 30))
        XCTAssertTrue(s1.searchMatrix(matrix, 18))
        XCTAssertTrue(s2.searchMatrix(matrix, 18))

        XCTAssertFalse(s1.searchMatrix(matrix, 0))  // less than lowest
        XCTAssertFalse(s2.searchMatrix(matrix, 0))  // less than lowest
        XCTAssertFalse(s1.searchMatrix(matrix, 50)) // more than highest
        XCTAssertFalse(s2.searchMatrix(matrix, 50)) // more than highest
        XCTAssertFalse(s1.searchMatrix(matrix, 25)) // in the middle
        XCTAssertFalse(s2.searchMatrix(matrix, 25)) // in the middle
    }
}

Tests.defaultTestSuite.run()
