import Foundation

// 413. Arithmetic Slices
// https://leetcode.com/problems/arithmetic-slices

// MARK: - Solution
// ================
class Solution1 {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var dp = [Int](repeating: 0, count: nums.count)
        var sum = 0

        for i in 2..<nums.count {
            if nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2] {
                dp[i] = 1 + dp[i - 1]
                sum += dp[i]
            }
        }
        return sum
    }
}

// Constant Space
class Solution2 {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var dp = 0
        var sum = 0

        for i in 2..<nums.count {
            if nums[i] - nums[i - 1] == nums[i - 1] - nums[i - 2] {
                dp = 1 + dp
                sum += dp
            } else {
                dp = 0
            }
        }
        return sum
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.numberOfArithmeticSlices([1, 2, 3, 4]), 3)
        XCTAssertEqual(s2.numberOfArithmeticSlices([1, 2, 3, 4]), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.numberOfArithmeticSlices([1]), 0)
        XCTAssertEqual(s2.numberOfArithmeticSlices([1]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.numberOfArithmeticSlices([1, 2, 3]), 1)
        XCTAssertEqual(s1.numberOfArithmeticSlices([1, 2, 3, 4]), 3)
        XCTAssertEqual(s1.numberOfArithmeticSlices([1, 2, 3, 4, 5]), 6)
        XCTAssertEqual(s1.numberOfArithmeticSlices([1, 2, 3, 4, 5, 6]), 10)

        XCTAssertEqual(s2.numberOfArithmeticSlices([1, 2, 3]), 1)
        XCTAssertEqual(s2.numberOfArithmeticSlices([1, 2, 3, 4]), 3)
        XCTAssertEqual(s2.numberOfArithmeticSlices([1, 2, 3, 4, 5]), 6)
        XCTAssertEqual(s2.numberOfArithmeticSlices([1, 2, 3, 4, 5, 6]), 10)

        XCTAssertEqual(s1.numberOfArithmeticSlices([1, 2, 3, 0, 4, 3, 2, 1]), 4) // 1 + 3
        XCTAssertEqual(s2.numberOfArithmeticSlices([1, 2, 3, 0, 4, 3, 2, 1]), 4) // 1 + 3
    }
}

Tests.defaultTestSuite.run()
