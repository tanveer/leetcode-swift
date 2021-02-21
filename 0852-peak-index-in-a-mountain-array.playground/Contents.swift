import Foundation

// 852. Peak Index in a Mountain Array
// https://leetcode.com/problems/peak-index-in-a-mountain-array

// MARK: - Solution
// ================
class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        for i in arr.indices.dropLast() where arr[i] > arr[i + 1] {
            return i
        }
        return -1
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
        XCTAssertEqual(s.peakIndexInMountainArray([0, 1, 0]), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.peakIndexInMountainArray([0, 2, 1, 0]), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.peakIndexInMountainArray([0, 10, 5, 2]), 1)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.peakIndexInMountainArray([3, 4, 5, 1]), 2)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.peakIndexInMountainArray([24, 69, 100, 99, 79, 78, 67, 36, 26, 19]), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.peakIndexInMountainArray([1, 2, 1]), 1)
    }
}

Tests.defaultTestSuite.run()
