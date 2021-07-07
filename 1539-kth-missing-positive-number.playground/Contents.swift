import Foundation

// 1539. Kth Missing Positive Number
// https://leetcode.com/problems/kth-missing-positive-number

// MARK: - Solution
// ================
class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var low = 0
        var high = arr.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            let currentDigit = (arr[mid] - mid) - 1

            if currentDigit < k {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return low + k
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlog)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findKthPositive([2, 3, 4, 7, 11], 5), 9)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findKthPositive([1, 2, 3, 4], 2), 6)
    }
}

Tests.defaultTestSuite.run()
