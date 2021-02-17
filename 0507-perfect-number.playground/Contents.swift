import Foundation

// 507. Perfect Number
// https://leetcode.com/problems/perfect-number

// MARK: - Solution
// ================
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        guard num > 4 else { return false }
        let root = Int(sqrt(Double(num)))
        var sum = 1

        for n in 2...root where num % n == 0 {
            sum += n
            if n != num / n {
                sum += num / n
            }
        }
        return sum == num
    }

    func checkPerfectNumberOneLiner(_ num: Int) -> Bool {
        return [6, 28, 496, 8128, 33550336].contains(num)
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
        XCTAssertTrue(s.checkPerfectNumber(28))
        XCTAssertTrue(s.checkPerfectNumberOneLiner(28))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.checkPerfectNumber(6))
        XCTAssertTrue(s.checkPerfectNumberOneLiner(28))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.checkPerfectNumber(496))
        XCTAssertTrue(s.checkPerfectNumberOneLiner(28))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.checkPerfectNumber(8128))
        XCTAssertTrue(s.checkPerfectNumberOneLiner(28))
    }

    func testLeetCodeExample5() {
        XCTAssertFalse(s.checkPerfectNumber(2))
        XCTAssertTrue(s.checkPerfectNumberOneLiner(28))
    }
}

Tests.defaultTestSuite.run()
