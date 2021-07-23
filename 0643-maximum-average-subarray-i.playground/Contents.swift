import Foundation

// 643. Maximum Average Subarray I
// https://leetcode.com/problems/maximum-average-subarray-i

// MARK: - Solution
// ================
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var maxAerage: Double = 0
        var sumOfCurrentWindow = 0
        var startWindow = 0

        for index in nums.indices {
            sumOfCurrentWindow += nums[index]
            if index >= k - 1 {
                maxAerage = max(maxAerage, sumOfCurrentWindow.double / k.double)
                sumOfCurrentWindow -= nums[startWindow]
                startWindow += 1
            }
        }

        return maxAerage
    }
}

extension Int {
    var double: Double {
        return Double(self)
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
        XCTAssertEqual(s.findMaxAverage([1, 12, -5, -6, 50, 3], 4), 12.75)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findMaxAverage([1, 1, 2], 2), 1.5)
    }
}

Tests.defaultTestSuite.run()
