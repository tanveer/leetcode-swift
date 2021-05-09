import Foundation

// 1346. Check If N and Its Double Exist
// https://leetcode.com/problems/check-if-n-and-its-double-exist

// MARK: - Solution
// ================
class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        guard !arr.isEmpty else { return false }
        var set = Set<Int>()

        for num in arr {
            if set.contains(num * 2) || num.isMultiple(of: 2) && set.contains(num / 2) {
                return true
            }
            set.insert(num)
        }
        return false
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
        XCTAssertTrue(s.checkIfExist([10, 2, 5, 3]))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.checkIfExist([7, 1, 14, 11]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.checkIfExist([3, 1, 7, 11]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.checkIfExist([]))
    }
}

Tests.defaultTestSuite.run()

