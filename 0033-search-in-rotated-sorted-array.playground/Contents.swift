import Foundation

// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array

// MARK: - Solution
// ================
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        var map = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if map[i] == nil {
                map[i] = num
            }

            if map[i]! == target {
                return i
            }
        }

        return -1
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
        XCTAssertEqual(s.search([4, 5, 6, 7, 0, 1, 2], 0), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.search([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.search([1], 0), -1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.search([], 0), -1)
    }
}

Tests.defaultTestSuite.run()
