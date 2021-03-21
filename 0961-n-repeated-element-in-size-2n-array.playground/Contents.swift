import Foundation

// 961. N-Repeated Element in Size 2N Array
// https://leetcode.com/problems/n-repeated-element-in-size-2n-array

// MARK: - Solution
// ================
class Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        let map = A.reduce(into: [:]) { dict, num in
            dict[num, default: 0] += 1
        }

        for num in A {
            if let count = map[num], count > 1 {
                return num
            }
        }

        return -1
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
        XCTAssertEqual(s.repeatedNTimes([1, 2, 3, 3]), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.repeatedNTimes([2, 1, 2, 5, 3, 2]), 2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.repeatedNTimes([5, 1, 5, 2, 5, 3, 5, 4]), 5)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.repeatedNTimes([9, 5, 6, 9]), 9)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.repeatedNTimes([1, 1]), 1)
    }
}

Tests.defaultTestSuite.run()
