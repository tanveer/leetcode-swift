import Foundation

// 605. Can Place Flowers
// https://leetcode.com/problems/can-place-flowers

// MARK: - Solution
// ================
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var adjcent = 0
        var count = 1

        for i in 0..<flowerbed.count {
            if flowerbed[i] == 0 {
                count += 1
            } else {
                adjcent += ( count - 1 ) / 2
                count = 0
            }
        }

        adjcent += count / 2

        return adjcent >= n
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)"

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.canPlaceFlowers([1, 0, 0, 0, 1], 1))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.canPlaceFlowers([1, 0, 0, 0, 1], 2))
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertTrue(s.canPlaceFlowers([0, 0, 1, 0, 1], 1))
    }

    // LeetCode Tests
    func testLeetCodeTest2() {
        XCTAssertTrue(s.canPlaceFlowers([1, 0, 0, 0, 1, 0, 0], 2))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.canPlaceFlowers([1], 0))
    }
}

Tests.defaultTestSuite.run()
