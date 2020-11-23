import Foundation

// 557. Reverse Words in a String III
// https://leetcode.com/problems/reverse-words-in-a-string-iii

// MARK: - Solution
// ================
class Solution {
    func reverseWords(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        
        var res = [String]()
        let words = s.split(separator: " ")
        
        for word in words {
            let reversed = String(word.reversed())
            res.append(reversed)
        }
        
        return res.joined(separator: " ")
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
        XCTAssertEqual(s.reverseWords("Let's take LeetCode contest"), "s'teL ekat edoCteeL tsetnoc")
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.reverseWords(""), "")
    }
}

Tests.defaultTestSuite.run()
