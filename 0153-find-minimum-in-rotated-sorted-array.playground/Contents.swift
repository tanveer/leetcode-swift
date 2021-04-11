import Foundation

// 153. Find Minimum in Rotated Sorted Array
// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array

// MARK: - Solution
// ================
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        var left = 0
        var right = nums.count - 1

        if nums[right] > nums[0] {
            return nums[0]
        }

        while right >= left {
            let mid = left + (right - left) / 2

            if nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }
            if nums[mid - 1] > nums[mid] {
                return nums[mid]
            }

            if nums[mid] > nums[0] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log(n))
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findMin([3, 4, 5, 1, 2]), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findMin([4, 5, 6, 7, 0, 1, 2]), 0)
    }
}

Tests.defaultTestSuite.run()
