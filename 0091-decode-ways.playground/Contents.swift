import Foundation

// 91. Decode Ways
// https://leetcode.com/problems/decode-ways

// MARK: - Solution
// ================
class Solution {
    func numDecodings(_ s: String) -> Int {
        guard let char = s.first, char != "0" else { return 0 }
        let chars = Array(s)
        var dp = [Int](repeating: 0, count: s.count + 1)

        dp[dp.count - 1] = 1
        for i in stride(from: dp.count - 2, through: 0, by: -1) {
            if chars[i] == "0" {
                guard let num = chars[i - 1].wholeNumberValue, num < 3 else { return 0 }
                dp[i] = 0
            } else {
                dp[i] = dp[i + 1]

                if (i + 1) < chars.count, let val = Int(String(chars[i...i + 1])), val < 27 {
                    dp[i] += dp[i + 2]
                }
            }
        }

        return dp[0]
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
        XCTAssertEqual(s.numDecodings("12"), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numDecodings("226"), 3)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.numDecodings("0"), 0)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.numDecodings("1"), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numDecodings(""), 0)
        XCTAssertEqual(s.numDecodings("1"), 1)
        XCTAssertEqual(s.numDecodings("11"), 2)
        XCTAssertEqual(s.numDecodings("111"), 3)
        XCTAssertEqual(s.numDecodings("1111"), 5)
        XCTAssertEqual(s.numDecodings("11111"), 8)
        XCTAssertEqual(s.numDecodings("111111"), 13)
        XCTAssertEqual(s.numDecodings("1111111"), 21)
    }
}

Tests.defaultTestSuite.run()
