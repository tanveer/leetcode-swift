import Foundation

// 1688. Count of Matches in Tournament
// https://leetcode.com/problems/count-of-matches-in-tournament/

// MARK: - Solution
// ================
class Solution1 {
    func numberOfMatches(_ n: Int) -> Int {
        var totalMatches = 0
        var original = n
        
        while original > 1 {
            totalMatches += original / 2
            original = (original % 2) + (original / 2)
        }
        return totalMatches
    }
}

class Solution2 {
    func numberOfMatches(_ n: Int) -> Int {
        return n - 1
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.numberOfMatches(7), 6)
        XCTAssertEqual(s2.numberOfMatches(7), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.numberOfMatches(14), 13)
        XCTAssertEqual(s2.numberOfMatches(14), 13)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.numberOfMatches(9), 8)
        XCTAssertEqual(s2.numberOfMatches(9), 8)
    }

    // Additional Examples
    func testAdditionalExamples4() {
        XCTAssertEqual(s1.numberOfMatches(15), 14)
        XCTAssertEqual(s2.numberOfMatches(15), 14)
    }
    
    func testAdditionalExamples5() {
        XCTAssertEqual(s1.numberOfMatches(0), 0)
        XCTAssertEqual(s2.numberOfMatches(0), 0)
    }
}

Tests.defaultTestSuite.run()
