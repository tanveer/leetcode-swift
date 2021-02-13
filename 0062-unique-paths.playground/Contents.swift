import Foundation

// 62. Unique Paths
// https://leetcode.com/problems/unique-paths

// MARK: - Solution
// ================
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0 else { return 0 }
        var dp = [Int](repeating: 1, count: n)

        for _ in 1..<m {
            for col in 1..<n {
                dp[col] += dp[col - 1]
            }
        }

        return dp.last ?? 0
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n+m)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.uniquePaths(3, 7), 28)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.uniquePaths(3, 2), 3)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.uniquePaths(7, 3), 28)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.uniquePaths(3, 3), 6)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.uniquePaths(0, 0), 0)
    }
}

Tests.defaultTestSuite.run()
