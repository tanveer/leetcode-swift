import Foundation

// 811. Subdomain Visit Count
// https://leetcode.com/problems/subdomain-visit-count

// MARK: - Solution
// ================
class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var domainCounts = [String: Int]()

        for cpdomain in cpdomains {
            let domain = cpdomain.split(separator: " ")
            var subdomain = String(domain[1])

            domainCounts[subdomain] = (domainCounts[subdomain] ?? 0) + Int(domain[0])!

            while let dotIndex = subdomain.firstIndex(of: ".") {
                subdomain.removeSubrange(subdomain.startIndex...dotIndex)
                domainCounts[subdomain] = (domainCounts[subdomain] ?? 0) + Int(domain[0])!
            }
        }

        let resultArray = domainCounts.reduce(into: []) { (a, pair) in
            a.append("\(pair.value) \(pair.key)")
        }

        return resultArray
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
        XCTAssertEqual(Set(s.subdomainVisits(["9001 discuss.leetcode.com"])), Set(["9001 discuss.leetcode.com", "9001 leetcode.com", "9001 com"]))
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(Set(s.subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"])), Set(["901 mail.com", "50 yahoo.com", "900 google.mail.com", "5 wiki.org", "5 org", "1 intel.mail.com", "951 com"]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.subdomainVisits([]), [])
    }
}

Tests.defaultTestSuite.run()
