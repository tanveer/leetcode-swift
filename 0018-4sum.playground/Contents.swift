import Foundation

// 18. 4Sum
// https://leetcode.com/problems/4sum

// MARK: - Solution
// ================
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else { return [] }

        let nums = nums.sorted()
        var result = [[Int]]()

        for i in 0..<nums.count {
            guard i == 0 || nums[i] != nums[i - 1] else { continue }

            for j in (i + 1)..<nums.count {
                guard j == (i + 1) || nums[j] != nums[j - 1] else { continue }

                var start = j + 1
                var end = nums.count - 1

                while start < end {
                    let sum = nums[i] + nums[j] + nums[start] + nums[end]
                    if sum == target {
                        result.append([nums[i], nums[j], nums[start], nums[end]])
                    }

                    if sum < target {
                        let currentStart = start
                        while nums[currentStart] == nums[start], start < nums.count - 1 {
                            start += 1
                        }
                    } else {
                        let currentEnd = end
                        while nums[currentEnd] == nums[end], end > j {
                            end -= 1
                        }
                    }
                }
            }
        }
        return result
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^3) || O(nlog(n)) ??
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.fourSum([1, 0, -1, 0, -2, 2], 0), [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.fourSum([], 0), [])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.fourSum([1, 1, 1, 1, 1], 4), [[1, 1, 1, 1]])
    }
}

Tests.defaultTestSuite.run()
