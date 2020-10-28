import Foundation

// 119. Pascal's Triangle II
// https://leetcode.com/problems/pascals-triangle-ii
// MARK: - Solution
// ================
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [Int]()
        guard rowIndex >= 0 else { return result }
        
        result.append(1)
        
        for _ in 0..<rowIndex {
            var j = result.count - 1
            while j > 0 {
                result[j] = result[j - 1] + result[j]
                j -= 1
            }
            result.append(1)
        }
        return result
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
        XCTAssertEqual(s.getRow(3), [1, 3, 3, 1])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.getRow(0), [1])
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.getRow(1), [1, 1])
    }
}

Tests.defaultTestSuite.run()
