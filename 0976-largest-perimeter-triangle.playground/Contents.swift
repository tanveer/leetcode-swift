import Foundation

// 976. Largest Perimeter Triangle
// https://leetcode.com/problems/largest-perimeter-triangle

// MARK: - Solution
// ================
class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        let nums = A.sorted { $0 > $1 }

        for i in 0...nums.count - 3 {
            let a = nums[i]
            let b = nums[i + 1]
            let c = nums[i + 2]

            if a < b + c {
                return a + b + c
            }
        }

        return 0
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n log(n))
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.largestPerimeter([2, 1, 2]), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.largestPerimeter([1, 2, 1]), 0)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.largestPerimeter([3, 2, 3, 4]), 10)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.largestPerimeter([3, 6, 2, 3]), 8)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.largestPerimeter([1, 1, 1]), 3)
    }
}

Tests.defaultTestSuite.run()
