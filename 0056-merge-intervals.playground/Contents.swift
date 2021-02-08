import Foundation

// 56. Merge Intervals
// https://leetcode.com/problems/merge-intervals

// MARK: - Solution
// ================
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var merged = [intervals[0]]

        for interval in intervals {
            let lastIndex = merged.count - 1
            let currentInterval = merged[lastIndex]
            let overlaps = !(interval[0] > currentInterval[1])

            if overlaps {
                let minInterval = min(currentInterval[0], interval[0])
                let maxInterval = max(currentInterval[1], interval[1])
                merged[lastIndex] = [minInterval, maxInterval]
            } else {
                merged.append(interval)
            }
        }

        return merged
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
        XCTAssertEqual(s.merge([[1, 3], [2, 6], [8, 10], [15, 18]]), [[1, 6], [8, 10], [15, 18]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.merge([[1, 4], [4, 5]]), [[1, 5]])
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.merge([[1, 4], [0, 4]]), [[0, 4]])
    }
}

Tests.defaultTestSuite.run()
