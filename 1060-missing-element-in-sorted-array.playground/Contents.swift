import Foundation

// 1060. Missing Element in Sorted Array
// https://leetcode.com/problems/missing-element-in-sorted-array

// MARK: - Solution
// ================
class Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        var missingNumber = k
        var difference = 0

        for (i, num) in nums.enumerated().dropFirst() {
            difference = num - nums[i - 1] - 1
            if difference >= missingNumber {
                return nums[i - 1] + missingNumber
            }
            missingNumber -= difference
        }
        return nums[nums.count - 1] + missingNumber
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
        XCTAssertEqual(s.missingElement([4, 7, 9, 10], 1), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.missingElement([4, 7, 9, 10], 3), 8)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.missingElement([1, 2, 4], 3), 6)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.missingElement([], 0), 0)
    }
}

Tests.defaultTestSuite.run()
