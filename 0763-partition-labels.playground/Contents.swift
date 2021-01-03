import Foundation

// 763. Partition Labels
// https://leetcode.com/problems/partition-labels

// MARK: - Solution
// ================
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        guard !S.isEmpty else { return [] }
        var lastIndex = [Int](repeating: 0, count: 26)
        let a = Character("a").asciiValue!
        
        for (index, char) in S.enumerated() {
            lastIndex[Int(char.asciiValue! - a)] = index
        }
        
        var start = 0
        var end = 0
        
        var result = [Int]()
        for (index , char) in S.enumerated() {
            end = max(end, lastIndex[Int(char.asciiValue! - a)]) // get last index of the char
            if index == end {
                result.append(end - start + 1)
                start = end + 1
            }
        }
        
        return result
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
        XCTAssertEqual(s.partitionLabels("ababcbacadefegdehijhklij"), [9, 7, 8])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.partitionLabels(""), [])
    }
}

Tests.defaultTestSuite.run()
