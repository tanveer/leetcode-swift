import Foundation

// 922. Sort Array By Parity II
// https://leetcode.com/problems/sort-array-by-parity-ii

// MARK: - Solution
// ================
class Solution {
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: nums.count)
        var n = 0
        for num in nums where num % 2 == 0 {
            result[n] = num
            n += 2
        }

        n = 1
        for num in nums where num % 2 == 1 {
            result[n] = num
            n += 2
        }

        return result
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
        XCTAssertEqual(s.sortArrayByParityII([4, 2, 5, 7]), [4, 5, 2, 7])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.sortArrayByParityII([]), [])
    }
}

Tests.defaultTestSuite.run()
