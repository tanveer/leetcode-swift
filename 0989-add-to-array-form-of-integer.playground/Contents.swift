import Foundation

// 989. Add to Array-Form of Integer
// https://leetcode.com/problems/add-to-array-form-of-integer

// MARK: - Solution
// ================
class Solution {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var answer = [Int]()
        var carry = K
        var i = A.count - 1

        while i >= 0 || carry > 0 {
            let digit = i >= 0 ? A[i] : 0
            let sum = carry + digit
            let num = sum % 10
            answer.append(num)
            carry = sum / 10
            i -= 1
        }
        return answer.reversed()
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(?)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.addToArrayForm([1, 2, 0, 0], 34), [1, 2, 3, 4])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.addToArrayForm([2, 7, 4], 181), [4, 5, 5])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.addToArrayForm([2, 1, 5], 806), [1, 0, 2, 1])
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.addToArrayForm([9, 9, 9, 9, 9, 9, 9, 9, 9, 9], 1), [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.addToArrayForm([], 0), [])
    }
}

Tests.defaultTestSuite.run()
