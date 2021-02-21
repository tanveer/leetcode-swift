import Foundation

// 830. Positions of Large Groups
// https://leetcode.com/problems/positions-of-large-groups

// MARK: - Solution
// ================
class Solution {
    func largeGroupPositions(_ s: String) -> [[Int]] {
        let arr = Array(s)
        var result = [[Int]]()
        var j = 0
        for i in 0..<s.count {
            if i == s.count - 1 || arr[i] != arr[i + 1] {
                if i - j + 1 >= 3 {
                    result.append([j, i])
                }
                j = i + 1
            }
        }
        return result
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
        XCTAssertEqual(s.largeGroupPositions("abbxxxxzzy"), [[3, 6]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.largeGroupPositions("abc"), [])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.largeGroupPositions("abcdddeeeeaabbbcd"), [[3, 5], [6, 9], [12, 14]])
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.largeGroupPositions("aba"), [])
    }
}

Tests.defaultTestSuite.run()
