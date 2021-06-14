import Foundation

// 605. Can Place Flowers
// https://leetcode.com/problems/can-place-flowers

// MARK: - Solution
// ================
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        guard !flowerbed.isEmpty else { return false }
        var flowerbed = flowerbed
        var space = 0

        for i in 0..<flowerbed.count {
            let isLeftSideEmpty = i == 0 || flowerbed[i - 1] == 0
            let isRightSideEmpty = i == flowerbed.count - 1 || flowerbed[i + 1] == 0
            if flowerbed[i] == 0, isLeftSideEmpty, isRightSideEmpty {
                space += 1
                flowerbed[i] = 1
            }
        }
        return space >= n
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
