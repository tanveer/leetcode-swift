import Foundation

// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array

// MARK: - Solution
// ================
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        return nums.sorted { $0 > $1 }[k - 1] // sort in reverse order and return k - 1
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n log(n))
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findKthLargest([3, 2, 1, 5, 6, 4], 2), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4), 4)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findKthLargest([0], 1), 0)
    }
}

Tests.defaultTestSuite.run()
