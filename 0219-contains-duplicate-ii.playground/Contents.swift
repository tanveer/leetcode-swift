import Foundation

// 219. Contains Duplicate II
// https://leetcode.com/problems/contains-duplicate-ii

// MARK: - Solution
// ================
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dupllicates = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if dupllicates[num] != nil, i - dupllicates[num]! <= k {
                return true
            } else {
                dupllicates[num] = i
            }
        }
        return false
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
        XCTAssertTrue(s.containsNearbyDuplicate([1, 2, 3, 1], 3))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.containsNearbyDuplicate([1, 0, 1, 1], 1))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2))
    }
}

Tests.defaultTestSuite.run()
