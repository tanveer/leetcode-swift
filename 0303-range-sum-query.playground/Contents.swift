import Foundation

// 303. Range Sum Query - Immutable
// https://leetcode.com/problems/range-sum-query-immutable

// MARK: - Solution
// ================
class NumArray {
    var sums:[Int] = []

    init(_ nums: [Int]) {
        self.sums = [Int](repeating: 0, count: nums.count + 1)

        for(i, num) in nums.enumerated() {
            sums[i + 1] = sums[i] + num
        }
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sums[j + 1] - sums[i]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let numArray = NumArray([-2, 0, 3, -5, 2, -1])
        XCTAssertEqual(numArray.sumRange(0, 2), 1)
        XCTAssertEqual(numArray.sumRange(2, 5), -1)
        XCTAssertEqual(numArray.sumRange(0, 5), -3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        let numArray = NumArray([1, 2, 3, 4, 5])
        XCTAssertEqual(numArray.sumRange(0, 4), 15)
        XCTAssertEqual(numArray.sumRange(1, 4), 14)
        XCTAssertEqual(numArray.sumRange(2, 3), 7)
    }
}

Tests.defaultTestSuite.run()
