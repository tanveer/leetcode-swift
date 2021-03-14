import Foundation

// 929. Unique Email Addresses
// https://leetcode.com/problems/unique-email-addresses

// MARK: - Solution
// ================
class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var validEmails = Set<String>()

        for email in emails {
            var filteredEmails = email.split(separator: "@")
            let localName = filteredEmails[0].filter { $0 != "." }.split(separator: "+")[0]
            filteredEmails[0] = localName // change current localName to filterd localName wiothout "."
            validEmails.insert(filteredEmails.joined(separator: "@"))
        }

        return validEmails.count
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
        XCTAssertEqual(s.numUniqueEmails(["test.email+alex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@lee.tcode.com"]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numUniqueEmails(["a@leetcode.com", "b@leetcode.com", "c@leetcode.com"]), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numUniqueEmails([]), 0)
    }
}

Tests.defaultTestSuite.run()
