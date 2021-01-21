import Foundation

// 643. Maximum Average Subarray I
// https://leetcode.com/problems/maximum-average-subarray-i

// MARK: - Solution
// ================
class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        guard !nums.isEmpty else { return 0.0 }
        var sum: Double = 0
        for i in 0..<k {
            sum += nums[i].doubleValue
        }

        var average = sum / k.doubleValue
        for i in k..<nums.count {
            sum += nums[i].doubleValue - nums[i - k].doubleValue
            average = max(average, sum / k.doubleValue)
        }

        return average
    }
}

extension Int {
    var doubleValue: Double {
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
        XCTAssertEqual(s.findMaxAverage([], 0), 0.0)
    }
}

Tests.defaultTestSuite.run()
