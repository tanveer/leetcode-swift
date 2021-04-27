import Foundation

// 1436. Destination City
// https://leetcode.com/problems/destination-city

// MARK: - Solution
// ================
class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var destination = ""
        var citiesMap = [String: String]()

        for path in paths {
            citiesMap[path[0]] = path[1]
        }

        for (_, city) in citiesMap where citiesMap[city] == nil {
            destination = city
        }

        return destination
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
        XCTAssertEqual(s.destCity([["London", "New York"], ["New York", "Lima"], ["Lima", "Sao Paulo"]]), "Sao Paulo")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.destCity([["B", "C"], ["D", "B"], ["C", "A"]]), "A")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.destCity([["A", "Z"]]), "Z")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.destCity([]), "")
    }
}

Tests.defaultTestSuite.run()
