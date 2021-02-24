import Foundation

// 908. Smallest Range I
// https://leetcode.com/problems/smallest-range-i

// MARK: - Solution
// ================
class Solution {
    func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
        guard let firstValue = A.first else { return 0 }
        var minValue = firstValue
        var maxValue = firstValue
        for n in A {
            minValue = min(minValue, n)
            maxValue = max(maxValue, n)
        }

        return (minValue + K) >= (maxValue - K ) ? 0 : ( maxValue - K) - (minValue + K)
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
        XCTAssertEqual(s.smallestRangeI([1], 0), 0)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.smallestRangeI([0, 10], 2), 6)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.smallestRangeI([1, 3, 6], 3), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.smallestRangeI([], 0), 0)
    }
}

Tests.defaultTestSuite.run()
