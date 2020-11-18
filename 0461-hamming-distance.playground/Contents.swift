import Foundation

// 461. Hamming Distance
// https://leetcode.com/problems/hamming-distance

// MARK: - Solution
// ================
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var count = 0
        var n = x ^ y
        
        while n > 0 {
            n &= n - 1
            count += 1
        }
        
        return count
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.hammingDistance(1, 4), 2)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.hammingDistance(0, 0), 0)
    }
}

Tests.defaultTestSuite.run()

