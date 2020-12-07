
import Foundation

// 693. Binary Number with Alternating Bits
// https://leetcode.com/problems/binary-number-with-alternating-bits

// MARK: - Solution
// ================
class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var num = n
        var last = num % 2
        num >>= 1
        
        while num > 0 {
            let curr = num % 2
            if last == curr {
                return false
            }
            last = curr
            num >>= 1
        }
        
        return true
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
        XCTAssertTrue(s.hasAlternatingBits(5))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.hasAlternatingBits(7))
    }
    
    func testLeetCodeExample3() {
        XCTAssertFalse(s.hasAlternatingBits(11))
    }
    
    func testLeetCodeExample4() {
        XCTAssertTrue(s.hasAlternatingBits(10))
    }
    
    func testLeetCodeExample5() {
        XCTAssertFalse(s.hasAlternatingBits(3))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.hasAlternatingBits(0))
    }
}

Tests.defaultTestSuite.run()
