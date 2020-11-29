import Foundation

// 575. Distribute Candies
// https://leetcode.com/problems/distribute-candies

// MARK: - Solution
// ================
class Solution {
    func distributeCandies(_ candies: [Int]) -> Int {
        let count = candies.count / 2

        var uniqueCandies = Set<Int>()
        for candy in candies where !uniqueCandies.contains(candy) {
            uniqueCandies.insert(candy)

            if uniqueCandies.count == count {
                return count
            }
        }

        return uniqueCandies.count
    }

    func distributeCandiesII(_ candies: [Int]) -> Int {
        var unique = Set<Int>()
        for candy in candies {
            unique.insert(candy)
        }
        return min(unique.count, candies.count/2)
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
        XCTAssertEqual(s.distributeCandies([1, 1, 2, 2, 3, 3]), 3)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.distributeCandies([1, 1, 2, 3]), 2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.distributeCandies([1, 1]), 1)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.distributeCandies([1, 11]), 1)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.distributeCandies([2, 2]), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.distributeCandiesII([1, 1, 2, 2, 3, 3]), 3)
    }
}

Tests.defaultTestSuite.run()

