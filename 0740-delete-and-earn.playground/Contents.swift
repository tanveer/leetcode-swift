import Foundation

// 740. Delete and Earn
// https://leetcode.com/problems/delete-and-earn

// MARK: - Solution
// ================
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var points = 0
        var avoid = 0
        var values = [Int](repeating: 0, count: nums.count * 10)
        for num in nums {
            values[num] += num
        }

        for value in values {
            let temp = max(avoid + value, points)
            avoid = points
            points = temp
        }

        return points
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.deleteAndEarn([3, 4, 2]), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.deleteAndEarn([2, 2, 3, 3, 3, 4]), 9)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.deleteAndEarn([]), 0)
    }
}

Tests.defaultTestSuite.run()
