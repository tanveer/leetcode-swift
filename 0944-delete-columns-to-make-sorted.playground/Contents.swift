import Foundation

// 944. Delete Columns to Make Sorted
// https://leetcode.com/problems/delete-columns-to-make-sorted

// MARK: - Solution
// ================
class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        var num = 0
        let grid = strs.map { [Character]($0) }
        for c in 0..<grid[0].count {
            for r in 0..<grid.count - 1 where grid[r][c] > grid[r + 1][c] {
                num += 1
                break
            }
        }
        return num
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
        XCTAssertEqual(s.minDeletionSize(["cba", "daf", "ghi"]), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.minDeletionSize(["a", "b"]), 0)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.minDeletionSize(["zyx", "wvu", "tsr"]), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.minDeletionSize([""]), 0)
    }
}

Tests.defaultTestSuite.run()
