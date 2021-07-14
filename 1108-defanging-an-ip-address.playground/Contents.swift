import Foundation

// 1108. Defanging an IP Address
// https://leetcode.com/problems/defanging-an-ip-address

// MARK: - Solution
// ================
class Solution1 {
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}

class Solution2 {
    func defangIPaddr(_ address: String) -> String {
        var output = ""
        for char in address {
            if char == "." {
                output.append("[.]")
            } else {
                output.append(char)
            }
        }
        return output
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
    let s1 = Solution1()
    let s2 = Solution2()


    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.defangIPaddr("1.1.1.1"), "1[.]1[.]1[.]1")
        XCTAssertEqual(s2.defangIPaddr("1.1.1.1"), "1[.]1[.]1[.]1")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.defangIPaddr("255.100.50.0"), "255[.]100[.]50[.]0")
        XCTAssertEqual(s2.defangIPaddr("255.100.50.0"), "255[.]100[.]50[.]0")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.defangIPaddr(""), "")
        XCTAssertEqual(s2.defangIPaddr(""), "")
    }
}

Tests.defaultTestSuite.run()
