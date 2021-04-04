import Foundation

// 468. Validate IP Address
// https://leetcode.com/problems/validate-ip-address

// MARK: - Solution
// ================
class Solution {
    func validIPAddress(_ IP: String) -> String {
        if IP.contains(".") {
            let token = IP.split(separator: ".", omittingEmptySubsequences: false)
            guard token.count == 4 else { return "Neither" }
            for t in token {
                guard
                    let value = Int(t), // valid integer
                    String(value) == t, // leading zeros check
                    (0...255).contains(value)
                else {
                    return "Neither"
                }
            }
            return "IPv4"
        } else if IP.contains(":") {
            let token = IP.split(separator: ":", omittingEmptySubsequences: false)
            guard token.count == 8 else { return "Neither" }
            for t in token {
                guard
                    Int(t, radix: 16) != nil,
                    (1...4).contains(t.count)
                else {
                    return "Neither"
                }
            }
            return "IPv6"
        }
        return "Neither"
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.validIPAddress("172.16.254.1"), "IPv4")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334"), "IPv6")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.validIPAddress("256.256.256.256"), "Neither")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334:"), "Neither")
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.validIPAddress("1e1.4.5.6"), "Neither")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.validIPAddress(""), "Neither")
    }
}

Tests.defaultTestSuite.run()
