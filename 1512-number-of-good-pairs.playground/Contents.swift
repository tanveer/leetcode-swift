import Foundation

// 1512. Number of Good Pairs
// https://leetcode.com/problems/number-of-good-pairs

// MARK: - Solution
// ================
class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var numCount = [Int: Int]()

        var count = 0
        for n in nums {
            if let val = numCount[n] {
                count += val
            }
            numCount[n, default: 0] += 1
        }

        return count
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
        XCTAssertEqual(s.numIdenticalPairs([1, 2, 3, 1, 1, 3]), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numIdenticalPairs([1, 1, 1, 1]), 6)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.numIdenticalPairs([1, 2, 3]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numIdenticalPairs([]), 0)
    }
}

Tests.defaultTestSuite.run()
