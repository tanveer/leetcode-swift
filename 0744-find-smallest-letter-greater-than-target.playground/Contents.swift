import Foundation

// 744. Find Smallest Letter Greater Than Target
// https://leetcode.com/problems/find-smallest-letter-greater-than-target

// MARK: - Solution
// ================
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var leftIndex = 0
        var rightIndex = letters.count - 1
        
        while leftIndex < rightIndex {
            let mid = leftIndex  + (rightIndex - leftIndex) / 2
            
            if target.asciiValue! < letters[mid].asciiValue! {
                rightIndex = mid
            } else {
                leftIndex = mid + 1
            }
        }
        
        return letters[leftIndex % letters.count]
    }
    
    func nextGreatestLetter2(_ letters: [Character], _ target: Character) -> Character {
        
        for c in letters {
            if c.asciiValue! > target.asciiValue! {
                return c
            }
        }
        
        return letters.first!
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log n)
// Space Complexity: O(1)

// Time Complexity for linear search: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExamples() {
        XCTAssertEqual(s.nextGreatestLetter(["c", "f", "j"], "a"), "c")
    }
    
    func testLeetCodeExamples1() {
        XCTAssertEqual(s.nextGreatestLetter(["c", "f", "j"], "c"), "f")
    }
    
    func testLeetCodeExamples2() {
        XCTAssertEqual(s.nextGreatestLetter(["c", "f", "j"], "d"), "f")
    }
    
    func testLeetCodeExamples3() {
        XCTAssertEqual(s.nextGreatestLetter2(["c", "f", "j"], "g"), "j")
    }
    
    func testLeetCodeExamples4() {
        XCTAssertEqual(s.nextGreatestLetter2(["c", "f", "j"], "j"), "c")
    }
    
    func testLeetCodeExamples5() {
        XCTAssertEqual(s.nextGreatestLetter2(["c", "f", "j"], "k"), "c")
    }
}

Tests.defaultTestSuite.run()

