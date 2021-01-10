import Foundation

// 190. Reverse Bits
// https://leetcode.com/problems/reverse-bits

// MARK: - Solution
// ================
class Solution {
    func reverseBits(_ n: Int) -> Int {
        var num = n
        var reversed = 0
        
        for _ in 0..<32 {
            reversed <<= 1
            if (num & 1) > 0 { reversed += 1 }
            num >>= 1
            
        }
        
        return reversed
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
        XCTAssertEqual(s.reverseBits(Int("00000010100101000001111010011100", radix: 2)!), (Int("00111001011110000010100101000000", radix: 2)!))
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.reverseBits(Int("11111111111111111111111111111101", radix: 2)!), (Int("10111111111111111111111111111111", radix: 2)!))
    }
}

Tests.defaultTestSuite.run()
