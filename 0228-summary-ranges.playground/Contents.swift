import Foundation

// 228. Summary Ranges
// https://leetcode.com/problems/summary-ranges

// MARK: - Solution
// ================
class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard  !nums.isEmpty else { return [] }

        var output = [String]()
        let count = nums.count

        var index = 0
        while index < count {
            var temp = index
            while temp + 1 < count, nums[temp] + 1 == nums[temp + 1] {
                temp += 1
            }
            output.append(index == temp ? "\(nums[index])" : "\(nums[index])->\(nums[temp])")
            index = temp + 1
        }

        return output
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
        XCTAssertEqual(s.summaryRanges([0, 1, 2, 4, 5, 7]), ["0->2", "4->5", "7"])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.summaryRanges([0, 2, 3, 4, 6, 8, 9]), ["0", "2->4", "6", "8->9"])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.summaryRanges([]), [])
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.summaryRanges([-1]), ["-1"])
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.summaryRanges([0]), ["0"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.summaryRanges([]), [])
    }
}

Tests.defaultTestSuite.run()
