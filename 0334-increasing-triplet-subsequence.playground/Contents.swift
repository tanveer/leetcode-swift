import Foundation

// 334. Increasing Triplet Subsequence
// https://leetcode.com/problems/increasing-triplet-subsequence

// MARK: - Solution
// ================
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var minNum = Int.max
        var maxNum = Int.max

        for num in nums {
            if num > maxNum {
                return true
            } else if num > minNum {
                maxNum = num
            } else {
                minNum = num
            }
        }

        return false
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
        XCTAssertTrue(s.increasingTriplet([1, 2, 3, 4, 5]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.increasingTriplet([5, 4, 3, 2, 1]))
    }
}

Tests.defaultTestSuite.run()
