import Foundation

// 566. Reshape the Matrix
// https://leetcode.com/problems/reshape-the-matrix

// MARK: - Solution
// ================
class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let row =  nums.count
        let col = nums.first?.count ?? 0
        guard row * col == r * c else { return nums }

        var reshaped = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
        let count = r * c

        for i in 0..<count {
            reshaped[i / c][i % c] = nums[i / col][i % col]
        }

        return reshaped
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let original = [
        [1, 2],
        [3, 4],
    ]
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.matrixReshape(original, 1, 4), [[1, 2, 3, 4]])
    }

    func testLeetCodeExample2() {

        XCTAssertEqual(s.matrixReshape(original, 2, 4), original)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.matrixReshape([], 0, 0), [])
    }
}

Tests.defaultTestSuite.run()

