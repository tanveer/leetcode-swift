import Foundation

// 46. Permutations
// https://leetcode.com/problems/permutations

// MARK: - Solution
// ================
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var permutations = [[Int]]()
        helper(0, &nums, &permutations)
        return permutations
    }

    func helper(_ n: Int, _ nums: inout [Int], _ permutations: inout [[Int]]) {
        if n == nums.count {
            permutations.append(nums)
        }

        for i in n..<nums.count {
            nums.swapAt(i, n)
            helper(n + 1, &nums, &permutations)
            nums.swapAt(n, i)
        }
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n!)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    /// LeetCode Examples
    func testLeetCodeExample1() {
        let expected = [
            [1, 2, 3],
            [1, 3, 2],
            [2, 1, 3],
            [2, 3, 1],
            [3, 1, 2],
            [3, 2, 1],
        ]
        XCTAssertEqual(Set(s.permute([1, 2, 3])), Set(expected))
    }
    func testLeetCodeExample2() {
        XCTAssertEqual(Set(s.permute([0, 1])), Set([[0, 1], [1, 0]]))
    }
    func testLeetCodeExample3() {
        XCTAssertEqual(s.permute([1]), [[1]])
    }
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.permute([]), [[]])
    }
}
Tests.defaultTestSuite.run()
