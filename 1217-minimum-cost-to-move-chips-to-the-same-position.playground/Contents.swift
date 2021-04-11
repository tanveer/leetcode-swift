import Foundation

// 1217. Minimum Cost to Move Chips to The Same Position
// https://leetcode.com/problems/minimum-cost-to-move-chips-to-the-same-position

// MARK: - Solution
// ================
class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        var odd = 0
        var even = 0

        for p in position {
            if p.isMultiple(of: 2) {
                odd += 1
            } else {
                even += 1
            }
        }

        if even == position.count || odd == position.count {
            return 0
        }

        return min(even, odd)
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
        XCTAssertEqual(s.minCostToMoveChips([1, 2, 3]), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.minCostToMoveChips([2, 2, 2, 3, 3]), 2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.minCostToMoveChips([1, 1_000_000_000]), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.minCostToMoveChips([]), 0)
    }
}

Tests.defaultTestSuite.run()
