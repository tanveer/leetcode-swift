import Foundation

// 1441. Build an Array With Stack Operations
// https://leetcode.com/problems/build-an-array-with-stack-operations

// MARK: - Solution
// ================
class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        guard !target.isEmpty else { return [] }
        var operations = [String]()
        var index = 0

        for num in 1...n where index != target.count {
            if num != target[index] {
                operations.append("Push")
                operations.append("Pop")
            } else {
                operations.append("Push")
                index += 1
            }
        }

        return operations
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
        XCTAssertEqual(s.buildArray([1, 3], 3), ["Push", "Push", "Pop", "Push"])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.buildArray([1, 2, 3], 3), ["Push", "Push", "Push"])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.buildArray([1, 2], 4), ["Push", "Push"])
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.buildArray([2, 3, 4], 4), ["Push", "Pop", "Push", "Push", "Push"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.buildArray([], 0), [])
    }
}

Tests.defaultTestSuite.run()
