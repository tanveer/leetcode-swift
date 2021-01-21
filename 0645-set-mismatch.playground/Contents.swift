import Foundation

// 645. Set Mismatch
// https://leetcode.com/problems/set-mismatch

// MARK: - Solution
// ================
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var duplicate = 0
        var missing = 0

        var set = Set<Int>()
        for num in nums {
            if !set.insert(num).inserted {
                duplicate = num
            }
        }

        for i in 1...nums.count {
            if !set.contains(i) {
                missing = i
            }
        }

        return [duplicate, missing]
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
        XCTAssertEqual(s.findErrorNums([1, 2, 2, 4]), [2, 3])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findErrorNums([]), [])
    }
}

Tests.defaultTestSuite.run()
