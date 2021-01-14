import Foundation

// 287. Find the Duplicate Number
// https://leetcode.com/problems/find-the-duplicate-number

// MARK: - Solution
// ================
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }

        let map = nums.reduce(into: [:]) { dict, num in
            dict[num, default: 0] += 1
        }

        for n in nums {
            if let count = map[n], count > 1 {
                return n
            }
        }

        return -1
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
        XCTAssertEqual(s.findDuplicate([1, 3, 4, 2, 2]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findDuplicate([3, 1, 3, 4, 2]), 3)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.findDuplicate([1, 1]), 1)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.findDuplicate([1, 1, 2]), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findDuplicate([]), 0)
    }
}

Tests.defaultTestSuite.run()
