import Foundation

// 476. Number Complement
// https://leetcode.com/problems/number-complement

// MARK: - Solution
// ================
class Solution {
    func findComplement(_ num: Int) -> Int {
        var i = 1
        
        while i <= num {
            i <<= 1
        }
        
        return (i - 1) ^ num
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
        XCTAssertEqual(s.findComplement(5), 2)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findComplement(1), 0)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findComplement(0), 0)
    }
}

Tests.defaultTestSuite.run()
