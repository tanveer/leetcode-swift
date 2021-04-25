import Foundation

// 1323. Maximum 69 Number
// https://leetcode.com/problems/maximum-69-number

// MARK: - Solution
// ================
class Solution {
    func maximum69Number(_ num: Int) -> Int {
        var digits = String(num).compactMap { $0.wholeNumberValue }
        for i in digits.indices where digits[i] == 6 {
            digits[i] = 9
            return Int(digits.map { String($0) }.joined()) ?? 0
        }
        return num
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
        XCTAssertEqual(s.maximum69Number(9669), 9969)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maximum69Number(9996), 9999)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maximum69Number(9999), 9999)
    }
}

Tests.defaultTestSuite.run()
