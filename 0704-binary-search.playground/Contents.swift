import Foundation

// 704. Binary Search
// https://leetcode.com/problems/binary-search

// MARK: - Solution
// ================
class Solution1 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return targetFoundIn(nums, target) ? nums.firstIndex(of: target)! : -1
    }

    func targetFoundIn(_ nums: [Int], _ target: Int) -> Bool {
        if nums.isEmpty {
            return false
        } else {
            let mid = nums.count / 2
            if nums[mid] == target {
                return true
            } else {
                let rightSubArray = Array(nums[(mid + 1)...])
                let leftSubArray = Array(nums[..<mid])
                return nums[mid] < target ? targetFoundIn(rightSubArray, target) : targetFoundIn(leftSubArray, target)
            }
        }
    }
}

class Solution2 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        var left = 0
        var right = nums.count - 1

        while left <= right {
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
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.search([-1, 0, 3, 5, 9, 12], 9), 4)
        XCTAssertEqual(s2.search([-1, 0, 3, 5, 9, 12], 9), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.search([-1, 0, 3, 5, 9, 12], 2), -1)
        XCTAssertEqual(s2.search([-1, 0, 3, 5, 9, 12], 2), -1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.search([0], 0), 0)
        XCTAssertEqual(s1.search([1], 1), 0)
        XCTAssertEqual(s2.search([0], 0), 0)
        XCTAssertEqual(s2.search([1], 1), 0)

        XCTAssertEqual(s1.search([], 0), -1)
        XCTAssertEqual(s1.search([1], 2), -1)
        XCTAssertEqual(s2.search([], 0), -1)
        XCTAssertEqual(s2.search([1], 2), -1)
    }
}

Tests.defaultTestSuite.run()
