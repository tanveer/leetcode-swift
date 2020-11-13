import Foundation

// 349. Intersection of Two Arrays
// https://leetcode.com/problems/intersection-of-two-arrays

// MARK: - Solution
// ================
import Foundation

// 349. Intersection of Two Arrays
// https://leetcode.com/problems/intersection-of-two-arrays

// MARK: - Solution
// ================
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        var result = Set<Int>()

        for num in nums1 {
            dict[num, default: 0] += 1
        }

        for num in nums2 {
            if dict[num] != nil {
                result.insert(num)
            }
        }

        return result.map{ $0 }
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.intersection([1, 2, 2, 1], [2, 2]), [2])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.intersection([4, 9, 5], [9, 4, 9, 8, 4]), [4, 9])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.intersection([], []), [])
    }
}

Tests.defaultTestSuite.run()
