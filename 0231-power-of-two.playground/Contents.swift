import Foundation

// 231. Power of Two
// https://leetcode.com/problems/power-of-two

// MARK: - Solution
// ================
class Solution1 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }

        var num = 1
        while num < n {
            num *= 2
        }

        return num == n
    }
}

class Solution2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n - 1) & n == 0
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) with while
// Time Complexity: O(1)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s1.isPowerOfTwo(1))
        XCTAssertTrue(s2.isPowerOfTwo(1))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s1.isPowerOfTwo(16))
        XCTAssertTrue(s2.isPowerOfTwo(16))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s1.isPowerOfTwo(3))
        XCTAssertFalse(s2.isPowerOfTwo(3))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s1.isPowerOfTwo(4))
        XCTAssertTrue(s2.isPowerOfTwo(4))
    }

    func testLeetCodeExample5() {
        XCTAssertFalse(s1.isPowerOfTwo(5))
        XCTAssertFalse(s2.isPowerOfTwo(5))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s1.isPowerOfTwo(0))
        XCTAssertFalse(s2.isPowerOfTwo(0))
    }
}

Tests.defaultTestSuite.run()
