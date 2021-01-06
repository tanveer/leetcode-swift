import Foundation

// 14. Longest Common Prefix
// https://leetcode.com/problems/longest-common-prefix

// MARK: - Solution
// ================
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        guard strs.count != 1 else { return strs[0] }
        
        let strs = strs.sorted(by: <)
        
        var output = ""
        for (char1, char2) in zip(strs.first!, strs.last!) {
            if char1 == char2 {
                output.append(char1)
            } else {
                break
            }
        }
        
        return output
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.longestCommonPrefix(["flower", "flow", "flight"]), "fl")
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.longestCommonPrefix(["dog", "racecar", "car"]), "")
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.longestCommonPrefix([]), "")
    }
}

Tests.defaultTestSuite.run()
