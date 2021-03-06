import Foundation

// 896. Monotonic Array
// https://leetcode.com/problems/monotonic-array

// MARK: - Solution
// ================
class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        var increasing = false
        var decreasing = false

        for i in A.indices.dropLast() {
            if A[i] > A[i + 1] {
                increasing = true
            } else if A[i] < A[i + 1] {
                decreasing = true
            }
            guard !(increasing&&decreasing) else { return false }
        }
        return true
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
        XCTAssertTrue(s.isMonotonic([1, 2, 2, 3]))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.isMonotonic([6, 5, 4, 4]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.isMonotonic([1, 3, 2]))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.isMonotonic([1, 2, 4, 5]))
    }

    func testLeetCodeExample5() {
        XCTAssertTrue(s.isMonotonic([1, 1, 1]))
    }
}

Tests.defaultTestSuite.run()
