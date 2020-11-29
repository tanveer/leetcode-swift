import Foundation

// 598. Range Addition II
// https://leetcode.com/problems/range-addition-ii

// MARK: - Solution
// ================
class Solution {
    func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
        var minX = m
        var minY = n

        for op in ops {
            minX = min(minX, op[0])
            minY = min(minY, op[1])
        }

        return minY * minX
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.maxCount(3, 3, [[2, 2], [3, 3]]), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxCount(3, 3, [[2, 2], [3, 3], [3, 3], [3, 3], [2, 2], [3, 3], [3, 3], [3, 3], [2, 2], [3, 3], [3, 3], [3, 3]]), 4)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxCount(3, 3, []), 9)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxCount(0, 0, []), 0)
    }
}

Tests.defaultTestSuite.run()

