import Foundation

// 75. Sort Colors
// https://leetcode.com/problems/sort-colors

// MARK: - Solution
// ================
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var i = 0
        var left = 0
        var right = nums.count - 1

        while i <= right {
            if nums[i] == 0 {
                nums.swapAt(i, left)
                i += 1
                left += 1
            } else if nums[i] == 1 {
                i += 1
            } else {
                nums.swapAt(i, right)
                right -= 1
            }
        }
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
        var inoutInput = [2, 0, 2, 1, 1, 0]
        s.sortColors(&inoutInput)
        XCTAssertEqual(inoutInput, [0, 0, 1, 1, 2, 2])
    }

    func testLeetCodeExample2() {
        var inoutInput = [2, 0, 1]
        s.sortColors(&inoutInput)
        XCTAssertEqual(inoutInput, [0, 1, 2])
    }

    func testLeetCodeExample3() {
        var inoutInput = [0]
        s.sortColors(&inoutInput)
        XCTAssertEqual(inoutInput, [0])
    }

    func testLeetCodeExample4() {
        var inoutInput = [1]
        s.sortColors(&inoutInput)
        XCTAssertEqual(inoutInput, [1])
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [Int] = []
        s.sortColors(&inoutInput)
        XCTAssertEqual(inoutInput, [])
    }
}

Tests.defaultTestSuite.run()
