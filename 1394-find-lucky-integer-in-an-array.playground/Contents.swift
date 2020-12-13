import Foundation

// 1394. Find Lucky Integer in an Array
// https://leetcode.com/problems/find-lucky-integer-in-an-array

// MARK: - Solution
// ================
class Solution {
    func findLucky(_ arr: [Int]) -> Int {
        guard !arr.isEmpty else { return -1 }
        let map = arr.reduce(into: [:]){ dict, num in
            dict[num, default: 0] += 1
        }
        
        var luckyInt = -1
        for (key, value) in map {
            if key == value, key > luckyInt {
                luckyInt = key
            }
        }
        
        return luckyInt
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
        XCTAssertEqual(s.findLucky([2, 2, 3, 4]), 2)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findLucky([1, 2, 2, 3, 3, 3]), 3)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.findLucky([2, 2, 2, 3, 3]), -1)
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.findLucky([5]), -1)
    }
    
    func testLeetCodeExample5() {
        XCTAssertEqual(s.findLucky([7, 7, 7, 7, 7, 7, 7]), 7)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findLucky([]), -1)
    }
}

Tests.defaultTestSuite.run()

