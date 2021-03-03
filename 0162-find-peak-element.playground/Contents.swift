import Foundation

// 162. Find Peak Element
// https://leetcode.com/problems/find-peak-element

// MARK: - Solution
// ================
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        for (i, num) in nums.enumerated() where num > nums[i + 1] {
            return i
        }
        return nums.count - 1
    }

    // binary search method
    func findPeakElement2(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) // using for loop
// Time Comnplexity: O(log(n)) // using binray search

// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findPeakElement([1, 2, 3, 1]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findPeakElement([1, 2, 1, 3, 5, 6, 4]), 1) // or 5
    }
}

Tests.defaultTestSuite.run()
