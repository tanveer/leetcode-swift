import Foundation

// 34. Find First and Last Position of Element in Sorted Array
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array

// MARK: - Solution
// ================
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }

        var result = [-1, -1]
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = left + (right - left) / 2

            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        guard nums[left] == target else { return result }
        result[0] = left

        right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2 + 1

            if target < nums[mid] {
                right = mid - 1
            } else {
                left = mid
            }
        }

        result[1] = left
        return result
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log n)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.searchRange([5, 7, 7, 8, 8, 10], 8), [3, 4])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.searchRange([5, 7, 7, 8, 8, 10], 6), [-1, -1])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.searchRange([], 0), [-1, -1])
    }
}

Tests.defaultTestSuite.run()
