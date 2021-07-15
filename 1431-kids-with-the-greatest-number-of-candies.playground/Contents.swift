import Foundation

// 1431. Kids With the Greatest Number of Candies
// https://leetcode.com/problems/kids-with-the-greatest-number-of-candies

// MARK: - Solution
// ================
class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var maxCandies = Int.min
        var output = [Bool](repeating: false, count: candies.count)

        for candy in candies {
            maxCandies = max(maxCandies, candy)
        }

        for index in candies.indices {
            output[index] = candies[index] + extraCandies >= maxCandies
        }

        return output
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
        XCTAssertEqual(s.kidsWithCandies([2, 3, 5, 1, 3], 3), [true, true, true, false, true])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.kidsWithCandies([4, 2, 1, 1, 2], 1), [true, false, false, false, false])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.kidsWithCandies([12, 1, 12], 10), [true, false, true])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.kidsWithCandies([], 0), [])
    }
}

Tests.defaultTestSuite.run()
