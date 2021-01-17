import Foundation

// 88. Merge Sorted Array
// https://leetcode.com/problems/merge-sorted-array

// MARK: - Solution
// ================
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard !nums1.isEmpty else { return }
        var maxCount = nums1.count - 1
        var p1 = m - 1
        var p2 = n - 1

        while maxCount >= 0 && p2 >= 0 {
            if p1 >= 0, nums1[p1] > nums2[p2] {
                nums1[maxCount] = nums1[p1]
                p1 -= 1
            } else {
                nums1[maxCount] = nums2[p2]
                p2 -= 1
            }
            maxCount -= 1
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
    func testLeetCodeExample() {
        var inoutInput = [1, 2, 3, 0, 0, 0]
        s.merge(&inoutInput, 3, [2, 5, 6], 3)
        XCTAssertEqual(inoutInput, [1, 2, 2, 3, 5, 6])
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [Int] = []
        s.merge(&inoutInput, 0, [], 0)
        XCTAssertEqual(inoutInput, [])
    }
}

Tests.defaultTestSuite.run()
