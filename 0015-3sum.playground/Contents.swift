import Foundation

// 15. 3Sum
// https://leetcode.com/problems/3sum

// MARK: - Solution
// ================
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var subsets = Set<[Int]>()
        let nums = nums.sorted()

        for (i, num) in nums.enumerated() where num <= 0 {
            let targetSum = 0 - num
            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[left] + nums[right]
                if sum == targetSum {
                    let res = [nums[i], nums[left], nums[right]]
                    subsets.insert(res)
                    left += 1
                    right -= 1
                } else if sum < targetSum {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }

        return Array(subsets)
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.threeSum([-1, 0, 1, 2, -1, -4]), [[-1, -1, 2], [-1, 0, 1]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.threeSum([]), [])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.threeSum([0]), [])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.threeSum([1, -1]), [])
        XCTAssertEqual(s.threeSum([0, 0, 0]), [[0, 0, 0]])
    }
}

Tests.defaultTestSuite.run()
