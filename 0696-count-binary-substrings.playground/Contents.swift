import Foundation

// 696. Count Binary Substrings
// https://leetcode.com/problems/count-binary-substrings

// MARK: - Solution
// ================
class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        guard s != "" else { return 0 }
        
        let digits = Array(s)
        var curr = 1
        var prev = 0
        var ans = 0
        
        for i in 1..<digits.count {
            if digits[i-1] != digits[i] {
                ans += min(prev, curr)
                prev = curr
                curr = 1
            } else {
                curr += 1
            }
        }
        return ans + min(prev, curr)
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
        XCTAssertEqual(s.countBinarySubstrings("00110011"), 6)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.countBinarySubstrings("10101"), 4)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.countBinarySubstrings(""), 0)
    }
}

Tests.defaultTestSuite.run()

