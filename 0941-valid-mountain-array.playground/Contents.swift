import Foundation

// 941. Valid Mountain Array
// https://leetcode.com/problems/valid-mountain-array

// MARK: - Solution
// ================
class Solution1 {
    func validMountainArray(_ A: [Int]) -> Bool {
        var index = 0
        let count = A.count

        while index + 1 < count, A[index] < A[index + 1] {
            index += 1
        }

        if index == 0 || index == count - 1 {
            return false
        }

        while index + 1 < count, A[index] > A[index + 1] {
            index += 1
        }

        return index == count - 1
    }
}

class Solution2 {
    func validMountainArray(_ A: [Int]) -> Bool {
        guard A.count >= 3 else { return false }

        var increasing = false
        var decreasing = false

        for i in A.indices.dropLast() {
            if A[i] < A[i + 1] && !decreasing {
                increasing = true
            } else if A[i] > A[i + 1] && increasing {
                decreasing = true
            } else {
                return false
            }
        }

        return increasing && decreasing
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertFalse(s1.validMountainArray([2, 1]))
        XCTAssertFalse(s2.validMountainArray([2, 1]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s1.validMountainArray([3, 5, 5]))
        XCTAssertFalse(s2.validMountainArray([3, 5, 5]))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s1.validMountainArray([0, 3, 2, 1]))
        XCTAssertTrue(s2.validMountainArray([0, 3, 2, 1]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s1.validMountainArray([]))
        XCTAssertFalse(s2.validMountainArray([]))
    }
}

Tests.defaultTestSuite.run()
