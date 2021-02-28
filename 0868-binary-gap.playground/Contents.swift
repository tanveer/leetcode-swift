import Foundation

// 868. Binary Gap
// https://leetcode.com/problems/binary-gap

// MARK: - Solution
// ================
class Solution {
    func binaryGap(_ N: Int) -> Int {
        var start = 0, end = 0, distance = 0

        for bit in String(N, radix: 2) {
            if bit == "1" {
                if start != end {
                    distance = max(distance, start - end)
                }
                end = start
            }
            start += 1
        }
        return distance
    }

    func binaryGap2(_ N: Int) -> Int {
        var last = -1, distance = 0

        for i in 0..<32 where (N >> i & 1) > 0 {
            if last >= 0 {
                distance = max(distance, i - last)
            }
            last = i
        }
        return distance
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
        XCTAssertEqual(s.binaryGap2(22), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.binaryGap2(5), 2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.binaryGap(6), 1)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.binaryGap(8), 0)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.binaryGap(1), 0)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.binaryGap(21), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.binaryGap(0), 0)
    }
}

Tests.defaultTestSuite.run()
