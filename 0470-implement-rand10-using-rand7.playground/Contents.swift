import Foundation

// 470. Implement Rand10() Using Rand7()
// https://leetcode.com/problems/implement-rand10-using-rand7

// MARK: - Solution
// ================
class SolBase {
    func rand7() -> Int {
        return Int.random(in: 1...7)
    }
}

class Solution1: SolBase {
    func rand10() -> Int {
        let v = rand7() + (rand7() - 1) * 7

        if v <= 40 {
            return 1 + (v - 1) % 10
        }
        return rand10()
    }
}

class Solution2: SolBase {
    func rand10() -> Int {
        var v1 = rand7()
        var v2 = rand7()

        while v1 > 5 {
            v1 = rand7()
        }

        while v2 == 7 {
            v2 = rand7()
        }

        return v2 <= 3 ? v1 : v1 + 5
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1) average
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        var counts = [Int: Int]()
        for _ in 1...1000 {
            let randomNumber = s1.rand10()
            let expectedRange = 1...10
            XCTAssertTrue(expectedRange.contains(randomNumber))
            counts[randomNumber, default: 0] += 1
        }
    }

    func testLeetCodeExample2() {
        var counts = [Int: Int]()
        for _ in 1...1000 {
            let randomNumber = s2.rand10()
            let expectedRange = 1...10
            XCTAssertTrue(expectedRange.contains(randomNumber))
            counts[randomNumber, default: 0] += 1
        }
    }
}

Tests.defaultTestSuite.run()
