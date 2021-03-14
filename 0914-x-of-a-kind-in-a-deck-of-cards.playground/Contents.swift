import Foundation

// 914. X of a Kind in a Deck of Cards
// https://leetcode.com/problems/x-of-a-kind-in-a-deck-of-cards

// MARK: - Solution
// ================
class Solution1 {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        let pairsCount = deck.reduce(into: [:]) { dict, card in
            dict[card, default: 0] += 1
        }

        var firstValue = pairsCount.values.first ?? 0

        for val in pairsCount.values {
            firstValue = gcd(firstValue, val)
        }

        return firstValue >= 2
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        return a == 0 ? b : gcd(b % a, a)
    }
}

class Solution2 {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        let pairsCount = deck.reduce(into: [:]) { dict, card in
            dict[card, default: 0] += 1
        }

        let values = pairsCount.values
        let minVal = values.min() ?? 0

        if minVal == 1 {
            return false
        }

        outer: for i in 2...minVal {
            for val in values where val % i != 0 {
                continue outer
            }
            return true
        }
        return false
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s1.hasGroupsSizeX([1, 2, 3, 4, 4, 3, 2, 1]))
        XCTAssertTrue(s2.hasGroupsSizeX([1, 2, 3, 4, 4, 3, 2, 1]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s1.hasGroupsSizeX([1, 1, 1, 2, 2, 2, 3, 3]))
        XCTAssertFalse(s2.hasGroupsSizeX([1, 1, 1, 2, 2, 2, 3, 3]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s1.hasGroupsSizeX([1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3]))
        XCTAssertFalse(s2.hasGroupsSizeX([1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3]))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s1.hasGroupsSizeX([1, 1]))
        XCTAssertTrue(s2.hasGroupsSizeX([1, 1]))
    }

    func testLeetCodeExample5() {
        XCTAssertTrue(s1.hasGroupsSizeX([1, 1, 2, 2, 2, 2]))
        XCTAssertTrue(s2.hasGroupsSizeX([1, 1, 2, 2, 2, 2]))
    }

    func testLeetCodeExample6() {
        XCTAssertFalse(s1.hasGroupsSizeX([1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3]))
        XCTAssertFalse(s2.hasGroupsSizeX([1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 3]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s1.hasGroupsSizeX([0, 0]))
        XCTAssertTrue(s2.hasGroupsSizeX([0, 0]))
    }
}

Tests.defaultTestSuite.run()
