import Foundation

// 49. Group Anagrams
// https://leetcode.com/problems/group-anagrams

// MARK: - Solution
// ================
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {        
        var dict = [String: [String]]()
        
        for word in strs {
            let sorted = String(word.sorted())
            if dict[sorted] == nil {
                dict[sorted] = [word]
            } else {
                dict[sorted]?.append(word)
            }
        }
        
        return Array(dict.values)
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
        XCTAssertEqual(s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]), [["tan", "nat"], ["bat"], ["eat", "tea", "ate"]])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.groupAnagrams([""]), [[""]])
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.groupAnagrams(["a"]), [["a"]])
    }
}

Tests.defaultTestSuite.run()
