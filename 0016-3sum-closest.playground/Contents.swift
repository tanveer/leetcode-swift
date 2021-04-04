import Foundation

// 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest

// MARK: - Solution
// ================
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var result = nums[0] + nums[1] + nums[nums.count - 1]
        let sorted = nums.sorted()

        for i in 0..<sorted.count - 2 {
            var left = i + 1
            var right = sorted.count - 1

            while left < right {
                let currSum = sorted[i] + sorted[left] + sorted[right]

                if currSum > target {
                    right -= 1
                } else {
                    left += 1
                }

                if abs(currSum - target) < abs(result - target) {
                    result = currSum
                }
            }
        }
        return result
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlog(n))
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.threeSumClosest([-1, 2, 1, -4], 1), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.threeSumClosest([1, 1, 1, 1], -100), 3)
    }
}

Tests.defaultTestSuite.run()
