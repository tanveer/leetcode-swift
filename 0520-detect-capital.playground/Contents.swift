import Foundation

// 520. Detect Capital
// https://leetcode.com/problems/detect-capital

// MARK: - Solution
// ================
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        let firstChar = Character(String(word.first!))
        
        if firstChar.isUppercase {
            if word == word.localizedUppercase {
                return true
            }
            
            for char in word.suffix(word.count-1) {
                if char.isUppercase {
                    return false
                }
            }
        } else {
            for char in word {
                if char.isUppercase {
                    return false
                }
            }
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
        XCTAssertTrue(s.detectCapitalUse("USA"))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.detectCapitalUse("FlaG"))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.detectCapitalUse(""))
    }
}

Tests.defaultTestSuite.run()
