import Foundation

// 923. 3Sum With Multiplicity
// https://leetcode.com/problems/3sum-with-multiplicity

// MARK: - Solution
// ================
class Solution {
    func threeSumMulti(_ A: [Int], _ target: Int) -> Int {
        let mod = 1_000_000_007
        var sum = 0
        for i in A.indices {
            var nums = [Int](repeating: 0, count: 101)
            for j in i + 1..<A.count {
                let num = target - A[i] - A[j]
                if num >= 0, num <= 100, nums[num] > 0 {
                    sum += nums[num]
                    sum %= mod
                }
                nums[A[j]] += 1
            }
        }
        return sum
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.threeSumMulti([1, 1, 2, 2, 3, 3, 4, 4, 5, 5], 8), 20)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.threeSumMulti([1, 1, 2, 2, 2, 2], 5), 12)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.threeSumMulti([], 0), 0)
    }
}

Tests.defaultTestSuite.run()
