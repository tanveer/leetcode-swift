import Foundation

// 434. Number of Segments in a String
// https://leetcode.com/problems/number-of-segments-in-a-string

// MARK: - Solution
// ================
class Solution {
    func countSegments(_ s: String) -> Int {
        guard s != "" else { return 0 }
        guard s != " " else { return 0 }
        var count = 0
        var prevChar: Character = "_"
        for (i, char) in s.enumerated() {
            let index = s.index(s.startIndex, offsetBy: i)
            if i == 0 || prevChar == " " && s[index] != " " {
                count += 1
            }
            prevChar = char
        }
        return count
    }
    
    func countSegment_builtIn(_ s: String) -> Int {
        guard s != "" else { return 0 }
        guard s != " " else { return 0 }
        return s.components(separatedBy: " ").filter{$0 != ""}.count
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
        XCTAssertEqual(s.countSegments("Hello, my name is John"), 5)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.countSegments("Hello"), 1)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.countSegment_builtIn("love live! mu'sic forever"), 4)
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.countSegments(""), 0)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.countSegments(" "), 0)
    }
}

Tests.defaultTestSuite.run()
