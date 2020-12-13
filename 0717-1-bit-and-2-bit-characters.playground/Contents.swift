import Foundation

// 717. 1-bit and 2-bit Characters
// https://leetcode.com/problems/1-bit-and-2-bit-characters

// MARK: - Solution
// ================
class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        guard !bits.isEmpty else { return false }
        var leftPointer = 0
        
        while leftPointer < bits.count - 1 {
            leftPointer += bits[leftPointer] + 1
        }
        
        return leftPointer == bits.count - 1
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
        XCTAssertTrue(s.isOneBitCharacter([1, 0, 0]))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.isOneBitCharacter([1, 1, 1, 0]))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.isOneBitCharacter([]))
    }
}

Tests.defaultTestSuite.run()

