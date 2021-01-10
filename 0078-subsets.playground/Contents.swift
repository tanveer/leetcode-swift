import Foundation

// 78. Subsets
// https://leetcode.com/problems/subsets

// MARK: - Solution
// ================
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [[]] }
        
        var subsets:[[Int]] = [[]]
        for num in nums {
            for i in stride(from: 0, to: subsets.count, by: 1) {
                var subset = subsets[i]
                subset.append(num)
                subsets.append(subset)
            }
        }
        
        return subsets
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
        let expected = [
            [],
            [1],
            [2],
            [1, 2],
            [3],
            [1, 3],
            [2, 3],
            [1, 2, 3],
        ]
        XCTAssertEqual(Set(s.subsets([1, 2, 3])), Set(expected))
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.subsets([0]), [[], [0]])
    }
    
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.subsets([]), [[]])
    }
}

Tests.defaultTestSuite.run()
