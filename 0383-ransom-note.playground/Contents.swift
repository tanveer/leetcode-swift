import Foundation

// 383. Ransom Note
// https://leetcode.com/problems/ransom-note

// MARK: - Solution
// ================
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard !magazine.isEmpty && !ransomNote.isEmpty else { return false }
        var maps = [Character: Int]()
        
        for c in magazine {
            maps[c] = (maps[c] ?? 0) + 1
        }
        
        for c in ransomNote {
            if maps[c] == nil || maps[c] == 0 {
                return false
            }
            maps[c]? -= 1
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
        XCTAssertFalse(s.canConstruct("a", "b"))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.canConstruct("aa", "ab"))
    }
    
    func testLeetCodeExample3() {
        XCTAssertTrue(s.canConstruct("aa", "aab"))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.canConstruct("", ""))
    }
}

Tests.defaultTestSuite.run()
