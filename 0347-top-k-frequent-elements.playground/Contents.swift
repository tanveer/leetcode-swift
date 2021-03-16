import Foundation

// 347. Top K Frequent Elements
// https://leetcode.com/problems/top-k-frequent-elements

// MARK: - Solution
// ================
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let hash = nums.reduce(into: [:]) {dict, num in
            dict[num, default: 0] += 1
        }
        var bucket = [Int: [Int]]()
        var result = [Int]()

        // Store elements in bucket. (key) == No. of frequency (value) == Array of elements that equal frequency count
        for (key, value) in hash {
            var array = bucket[value] ?? []
            array.append(key)
            bucket[value] = array
        }

        // Store elements from greatest to least until result.count == k
        var index = nums.count
        while result.count < k {
            if let elements = bucket[index] {
                for element in elements {
                    result.append(element)
                }
            }
            index -= 1
        }

        return result
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
        XCTAssertEqual(s.topKFrequent([1, 1, 1, 2, 2, 3], 2), [1, 2])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.topKFrequent([1], 1), [1])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.topKFrequent([], 0), [])
    }
}

Tests.defaultTestSuite.run()
