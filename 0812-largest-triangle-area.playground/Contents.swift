import Foundation

// 812. Largest Triangle Area
// https://leetcode.com/problems/largest-triangle-area

// MARK: - Solution
// ================
class Solution {
    let x = 0
    let y = 1

    func largestTriangleArea(_ points: [[Int]]) -> Double {
        var maxArea = 0.0
        for i in stride(from: 0, through: points.count - 3, by: 1) {
            for j in stride(from: i + 1, through: points.count - 2, by: 1) {
                for k in stride(from: j + 1, through: points.count - 1, by: 1) {
                    let array = [points[i], points[j], points[k]]
                    maxArea = max(maxArea, calculateTraiangle(from: array))
                }
            }
        }

        return maxArea
    }

    func calculateTraiangle(from points: [[Int]]) -> Double {
        var area = points[0][x] * points[1][y]
        area += points[1][x] * points[2][y]
        area += points[2][x] * points[0][y]

        area -= points[0][y] * points[1][x]
        area -= points[1][y] * points[2][x]
        area -= points[2][y] * points[0][x]

        return abs(0.5 * Double(area))
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^3)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.largestTriangleArea([[0, 0], [0, 1], [1, 0], [0, 2], [2, 0]]), 2)
    }
    // LeetCode Examples
    func testLeetCodeTest1() {
        XCTAssertEqual(s.largestTriangleArea([[1, 0], [0, 0], [0, 1]]), 0.5)
    }
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.largestTriangleArea([[0, 0], [0, 0], [0, 0]]), 0)
    }
}

Tests.defaultTestSuite.run()
