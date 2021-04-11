import Foundation

// 376. Wiggle Subsequence
// https://leetcode.com/problems/wiggle-subsequence

// MARK: - Solution
// ================
class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var down = 1
        var up = 1
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                up = down + 1
            } else if nums[i] < nums[i - 1] {
                down = up + 1
            }
        }
        return max(down, up)
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
        XCTAssertEqual(s.wiggleMaxLength([1, 7, 4, 9, 2, 5]), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.wiggleMaxLength([1, 17, 5, 10, 13, 15, 10, 5, 16, 8]), 7)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.wiggleMaxLength([1, 2, 3, 4, 5, 6, 7, 8, 9]), 2)
    }
}

Tests.defaultTestSuite.run()
