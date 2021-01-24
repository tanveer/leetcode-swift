import Foundation

// 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array

// MARK: - Solution
// ================
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }

        let pivot = findPivot(nums, 0, nums.count - 1)
        var left = 0
        var right = nums.count - 1

        if target >= nums[pivot] && target <= nums[right] {
            left = pivot
        } else {
            right = pivot
        }

        while  left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return -1
    }

    func findPivot(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var left = l
        var right = r
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
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
