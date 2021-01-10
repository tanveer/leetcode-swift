import Foundation

// 290. Word Pattern
// https://leetcode.com/problems/word-pattern

// MARK: - Solution
// ================
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.split(separator: " ").map { String($0) }
        let chars = pattern.map { Character(extendedGraphemeClusterLiteral: $0) }
        guard words.count == chars.count else { return false }
        
        var map = [Character: String]()
        for (i, word) in words.enumerated() {
            if !map.keys.contains(chars[i]) {
                if map.values.contains(word) {
                    return false
                } else {
                    map[chars[i]] = word
                }
            } else {
                if map[chars[i]] != word {
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
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.wordPattern("abba", "dog cat cat dog"))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.wordPattern("abba", "dog cat cat fish"))
    }
    
    func testLeetCodeExample3() {
        XCTAssertFalse(s.wordPattern("aaaa", "dog cat cat dog"))
    }
    
    func testLeetCodeExample4() {
        XCTAssertFalse(s.wordPattern("abba", "dog dog dog dog"))
    }
    
    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertFalse(s.wordPattern("aaa", "aa aa aa aa"))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.wordPattern("", ""))
    }
}

Tests.defaultTestSuite.run()
