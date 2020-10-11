//
//  Created by Tanveer Bashir on 10/11/20.
//
// 118. Pascal's Triangle
//  https://leetcode.com/problems/pascals-triangle/

// MARK: - Solution
class Solution{
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [] }

        var triangle = [[Int]]()
        var prevRow = [1]

        while triangle.count < numRows {
            triangle.append(prevRow)
            var newRow = [1]

            for i in 0..<prevRow.count - 1 {
                newRow.append(prevRow[i] + prevRow[i+1])
            }
            newRow.append(1)
            prevRow = newRow
        }
        return triangle
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample() {
        let output = [
            [1],
            [1, 1],
            [1, 2, 1],
            [1, 3, 3, 1],
            [1, 4, 6, 4, 1],
        ]
        XCTAssertEqual(s.generate(5), output)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.generate(0), [])
        XCTAssertEqual(s.generate(1), [[1]])
        XCTAssertEqual(s.generate(2), [[1], [1, 1]])
    }
}

Tests.defaultTestSuite.run()
