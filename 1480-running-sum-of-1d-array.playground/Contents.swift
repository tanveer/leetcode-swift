import Foundation

// 1480. Running Sum of 1d Array
// https://leetcode.com/problems/running-sum-of-1d-array

// MARK: - Solution
// ================
class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var output = nums

        for i in output.indices.dropFirst() {
            output[i] += nums[i - 1]
        }
        return output
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
        XCTAssertEqual(s.runningSum([1, 2, 3, 4]), [1, 3, 6, 10])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.runningSum([1, 1, 1, 1, 1]), [1, 2, 3, 4, 5])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.runningSum([3, 1, 2, 10, 1]), [3, 4, 6, 16, 17])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.runningSum([]), [])
    }
}

Tests.defaultTestSuite.run()
