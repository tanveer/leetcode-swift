import Foundation

// 338. Counting Bits
// https://leetcode.com/problems/counting-bits

// MARK: - Solution
// ================
class Solution {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }

        var output = [Int](repeating: 0, count: num + 1)
        for n in 1...num {
            let value = output[n >> 1] + n % 2
            output[n] = value
        }

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
        XCTAssertEqual(s.countBits(2), [0, 1, 1])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.countBits(5), [0, 1, 1, 2, 1, 2])
    }

    func testAdditionalExamples() {
        XCTAssertEqual(s.countBits(0), [0])
    }
}

Tests.defaultTestSuite.run()
