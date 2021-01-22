import Foundation

// 54. Spiral Matrix
// https://leetcode.com/problems/spiral-matrix

// MARK: - Solution
// ================
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var seen = [[Bool]](repeating: [Bool](repeating: false, count: matrix[0].count), count: matrix.count)

        var firstRow = 0
        var firstCol = 0
        var lastRow = matrix.count - 1
        guard let first = matrix.first else { fatalError() }
        var lastCol = first.count - 1
        var direction = "R"

        while firstRow <= lastRow && firstCol <= lastCol {
            if direction == "R" {
                for i in firstCol..<lastCol + 1 where seen[firstRow][i] == false {
                    result.append(matrix[firstRow][i])
                    seen[firstRow][i] = true
                }

                firstRow += 1
                direction = "D"
            }

            if direction == "D" {
                for i in firstRow..<lastRow + 1 where seen[i][lastCol] == false {
                    result.append(matrix[i][lastCol])
                    seen[i][lastCol] = true
                }

                lastCol -= 1
                direction = "L"
            }

            if direction == "L" {
                for i in stride(from: lastCol, through: firstCol, by: -1)
                    where seen[lastRow][i] == false {
                    result.append(matrix[lastRow][i])
                    seen[lastRow][i] = true
                }

                lastRow -= 1
                direction = "U"
            }

            if direction == "U" {
                for i in stride(from: lastRow, through: firstRow, by: -1)
                    where seen[i][firstCol] == false {
                    result.append(matrix[i][firstCol])
                    seen[i][firstCol] = true
                }

                firstCol += 1
                direction = "R"
            }
        }

        return result
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m+n)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let matrix = [
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ],
        ]
        XCTAssertEqual(s.spiralOrder(matrix), [1, 2, 3, 6, 9, 8, 7, 4, 5])
    }

    func testLeetCodeExample2() {
        let matrix = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
        ]
        XCTAssertEqual(s.spiralOrder(matrix), [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7])
    }
}

Tests.defaultTestSuite.run()
