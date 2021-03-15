import Foundation

// 300. Longest Increasing Subsequence
// https://leetcode.com/problems/longest-increasing-subsequence

// MARK: - Solution
// ================
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        var maxLengthOfLIS = -1

        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            maxLengthOfLIS = max(maxLengthOfLIS, dp[i])
        }

        return maxLengthOfLIS
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
        XCTAssertEqual(s.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]), 4) // [2, 3, 7, 101]
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.lengthOfLIS([0, 1, 0, 3, 2, 3]), 4)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.lengthOfLIS([7, 7, 7, 7, 7, 7, 7]), 1)
    }
}

Tests.defaultTestSuite.run()
