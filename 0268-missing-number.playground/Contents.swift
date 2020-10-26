import Foundation

// 268. Missing Number
// https://leetcode.com/problems/missing-number

// MARK: - Solution
// ================
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = 0
        var count = nums.count

        for i in 0..<nums.count {
            count += i
            sum += nums[i]
        }

        return count - sum
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
        XCTAssertEqual(s.missingNumber([3, 0, 1]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.missingNumber([0, 1]), 2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]), 8)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.missingNumber([0]), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.missingNumber([]), 0)
    }
}

Tests.defaultTestSuite.run()

