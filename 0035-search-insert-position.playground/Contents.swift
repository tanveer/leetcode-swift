import Foundation

// 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position

// MARK: - Solution
// ================
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = left + (right - left) / 2

            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                return mid
            }
        }

        return left
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
        XCTAssertEqual(s.searchInsert([1, 3, 5, 6], 5), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.searchInsert([1, 3, 5, 6], 2), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.searchInsert([1, 3, 5, 6], 7), 4)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.searchInsert([1, 3, 5, 6], 0), 0)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.searchInsert([1], 0), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.searchInsert([0, 1, 2], -1), 0)
    }
}

Tests.defaultTestSuite.run()
