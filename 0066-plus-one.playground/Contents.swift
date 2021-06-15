import Foundation

// 66. Plus One
// https://leetcode.com/problems/plus-one

// MARK: - Solution
// ================
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        guard !digits.isEmpty else { return [] }
        var original = digits

        for i in original.indices.reversed() {
            if original[i] != 9 {
                original[i] += 1
                return original
            } else {
                original[i] = 0
            }
        }

        // incase of all 9's create a new array of size result.count + 1
        var output = [Int](repeating: 0, count: original.count + 1)

        // set first index to 1 and return the new array
        output[0] = 1
        return output
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
        XCTAssertEqual(s.plusOne([1, 2, 3]), [1, 2, 4])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.plusOne([4, 3, 2, 1]), [4, 3, 2, 2])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.plusOne([0]), [1])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.plusOne([9, 9]), [1, 0, 0])
    }
}

Tests.defaultTestSuite.run()
