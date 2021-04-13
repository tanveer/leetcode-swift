import Foundation

// 456. 132 Pattern
// https://leetcode.com/problems/132-pattern

// MARK: - Solution
// ================
class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return false }
        var stack: [Int] = []
        var mid = Int.min

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[i] < mid {
                return true
            }

            while !stack.isEmpty, nums[i] > stack[stack.count - 1] {
                mid = max(mid, stack.removeLast())
            }
            stack.append(nums[i])
        }
        return false
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertFalse(s.find132pattern([1, 2, 3, 4]))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.find132pattern([3, 1, 4, 2]))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.find132pattern([-1, 3, 2, 0]))
    }
}

Tests.defaultTestSuite.run()
