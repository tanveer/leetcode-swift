import Foundation

// 134. Gas Station
// https://leetcode.com/problems/gas-station

// MARK: - Solution
// ================
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalGas = 0
        var negitiveGas = 0
        var startPoint = 0

        for i in gas.indices {
            totalGas += gas[i] - cost[i]
            if totalGas < 0 {
                negitiveGas += totalGas
                totalGas = 0
                startPoint = i + 1
            }
        }

        return totalGas + negitiveGas < 0 ? -1 : startPoint
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
        XCTAssertEqual(s.canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2]), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.canCompleteCircuit([2, 3, 4], [3, 4, 3]), -1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.canCompleteCircuit([], []), 0)
    }
}

Tests.defaultTestSuite.run()
