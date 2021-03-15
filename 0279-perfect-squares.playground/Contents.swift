import Foundation

// 279. Perfect Squares
// https://leetcode.com/problems/perfect-squares

// MARK: - Solution
// ================
class Solution {
    func numSquares(_ n: Int) -> Int {
        guard n > 1  else { return  n }

        var dp = [Int](0...n + 1)
        var squares = [Int]()
        var num = 1

        while num * num <= n {
            squares.append(num * num)
            num += 1
        }

        for i in 2...n {
            for square in squares {
                if square <= i {
                    dp[i] = min(dp[i], dp[i - square] + 1)
                }
            }
        }

        return dp[n]
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n x square)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.numSquares(12), 3) // 4 + 4 + 4 not 9 + 1 + 1 + 1
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numSquares(13), 2) // 3 + 9
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numSquares(0), 0)
        XCTAssertEqual(s.numSquares(1), 1) // 1
        XCTAssertEqual(s.numSquares(2), 2) // 1 + 1
        XCTAssertEqual(s.numSquares(3), 3) // 1 + 1 + 1
        XCTAssertEqual(s.numSquares(4), 1) // 4
        XCTAssertEqual(s.numSquares(5), 2) // 4 + 1
        XCTAssertEqual(s.numSquares(6), 3) // 4 + 1 + 1
        XCTAssertEqual(s.numSquares(7), 4) // 4 + 1 + 1 + 1
        XCTAssertEqual(s.numSquares(8), 2) // 4 + 4
        XCTAssertEqual(s.numSquares(9), 1) // 9
        XCTAssertEqual(s.numSquares(10), 2) // 9 + 1
        XCTAssertEqual(s.numSquares(11), 3) // 9 + 1 + 1
        XCTAssertEqual(s.numSquares(12), 3) // 4 + 4 + 4 (DP is needed because choosing 9 would give an answer of 4)
        XCTAssertEqual(s.numSquares(13), 2) // 9 + 4
        XCTAssertEqual(s.numSquares(14), 3) // 9 + 4 + 1
        XCTAssertEqual(s.numSquares(15), 4) // 9 + 4 + 1 + 1
        XCTAssertEqual(s.numSquares(16), 1) // 16
    }
}

Tests.defaultTestSuite.run()
