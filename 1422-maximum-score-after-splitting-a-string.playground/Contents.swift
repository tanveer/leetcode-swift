import Foundation

// 1422. Maximum Score After Splitting a String
// https://leetcode.com/problems/maximum-score-after-splitting-a-string

// MARK: - Solution
// ================
class Solution {
    func maxScore(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var maxScore = Int.min
        var onesCount = 0
        var zerosCount = 0

        // count all ones
        for char in s {
            onesCount += char == "1" ? 1 : 0
        }

        // count all zeros and decrement onesCount
        // keep updating maxScore
        for char in s.dropLast() {
            zerosCount += char == "0" ? 1 : 0
            onesCount -= char == "1" ? 1 : 0
            maxScore = max(maxScore, onesCount + zerosCount)
        }

        return maxScore
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
        XCTAssertEqual(s.maxScore("011101"), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxScore("00111"), 5)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxScore("1111"), 3)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.maxScore("00"), 1)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.maxScore("0100"), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxScore(""), 0)
    }
}

Tests.defaultTestSuite.run()
