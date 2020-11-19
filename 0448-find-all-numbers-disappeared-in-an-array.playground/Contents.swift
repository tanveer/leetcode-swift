import Foundation

// 448. Find All Numbers Disappeared in an Array
// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array

// MARK: - Solution
// ================
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        let numsSet = Set(nums)

        var missingNumber = [Int]()
        for num in 1...nums.count where !numsSet.contains(num) {
            missingNumber.append(num)
        }

        return missingNumber
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1]), [5, 6])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findDisappearedNumbers([]), [])
    }
}

Tests.defaultTestSuite.run()

