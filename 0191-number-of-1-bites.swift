//  Created by Tanveer Bashir on 10/18/20.
//
// 191. Number of 1 Bits
// https://leetcode.com/problems/number-of-1-bits

// MARK: - Solution
// ================
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var sum = 0
        
        while n != 0 {
            sum += 1
            n &= (n - 1)
        }
        
        return sum
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
        XCTAssertEqual(s.hammingWeight(Int("00000000000000000000000000001011", radix: 2)!), 3)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.hammingWeight(Int("00000000000000000000000010000000", radix: 2)!), 1)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.hammingWeight(Int("11111111111111111111111111111101", radix: 2)!), 31)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.hammingWeight(0), 0)
    }
}

Tests.defaultTestSuite.run()

