import Foundation

// 179. Largest Number
// https://leetcode.com/problems/largest-number

// MARK: - Solution
// ================
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        guard !nums.isEmpty else { return "" }
        var numbers = nums.map { String($0) }
        numbers.sort { return $0 + $1 > $1 + $0 }
        return numbers.first == "0" ? "0" : numbers.joined()
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
        XCTAssertEqual(s.largestNumber([10, 2]), "210")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.largestNumber([3, 30, 34, 5, 9]), "9534330")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.largestNumber([1]), "1")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.largestNumber([10]), "10")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.largestNumber([]), "")
    }
}

Tests.defaultTestSuite.run()
