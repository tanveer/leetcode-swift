import Foundation

// 674. Longest Continuous Increasing Subsequence
// https://leetcode.com/problems/longest-continuous-increasing-subsequence

// MARK: - Solution
// ================
class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        var count = 0
        var result = 0
        
        for (i, num) in nums.enumerated() {
            count = i > 0 && nums[i-1] >= num ? i : count
            result = max(result, (i - count) + 1)
        }
        
        return result
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
        XCTAssertEqual(s.findLengthOfLCIS([1, 3, 5, 4, 7]), 3)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findLengthOfLCIS([2, 2, 2, 2, 2]), 1)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findLengthOfLCIS([]), 0)
    }
}

Tests.defaultTestSuite.run()

