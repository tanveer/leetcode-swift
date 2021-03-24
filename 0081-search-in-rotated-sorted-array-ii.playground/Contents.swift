import Foundation

// 81. Search in Rotated Sorted Array II
// https://leetcode.com/problems/search-in-rotated-sorted-array-ii

// MARK: - Solution
// ================
class Solution1 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard !nums.isEmpty else { return false }
        let minIdx = findPivot(0, nums.count - 1, nums)
        return binarySearch(0, minIdx - 1, target, nums) || binarySearch(minIdx, nums.count - 1, target, nums)
    }

    func findPivot(_ left: Int, _ right: Int, _ nums: [Int]) -> Int {
        if right - left == 1, nums[right] < nums[left] {
            return right
        }

        if right - left <= 1 {
            return 0
        }

        let mid = (left + right) / 2

        if nums[mid] > nums[right] {
            return findPivot(mid, right, nums)
        }
        if nums[mid] < nums[left] {
            return findPivot(left, mid, nums)
        }

        return max(findPivot(left, mid, nums), findPivot(mid, right, nums))
    }

    func binarySearch(_ start: Int, _ end: Int, _ target: Int, _ nums: [Int]) -> Bool {
        var end = end
        var start = start
        while start <= end {
            let mid = (start + end) / 2

            if nums[mid] == target {
                return true
            }
            if nums[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return false
    }
}

class Solution2 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        for num in nums where num == target {
            return true
        }
        return false
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log(n)) or O(n) best and worst case
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s1.search([2, 5, 6, 0, 0, 1, 2], 0))
        XCTAssertTrue(s2.search([2, 5, 6, 0, 0, 1, 2], 0))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s1.search([2, 5, 6, 0, 0, 1, 2], 3))
        XCTAssertFalse(s2.search([2, 5, 6, 0, 0, 1, 2], 3))
    }

    func testLeetcodeExample3() {
        XCTAssertTrue(s1.search([1, 0, 1, 1, 1], 0))
        XCTAssertTrue(s2.search([1, 0, 1, 1, 1], 0))
    }
}

Tests.defaultTestSuite.run()
