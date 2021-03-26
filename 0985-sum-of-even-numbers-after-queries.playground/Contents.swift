import Foundation

// 985. Sum of Even Numbers After Queries
// https://leetcode.com/problems/sum-of-even-numbers-after-queries

// MARK: - Solution
// ================
class Solution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var A = A
        var output = [Int](repeating: 0, count: queries.count)

        // sum all even values in A
        var evenSum = A.reduce(into: 0) { num, n in
            num += n.isMultiple(of: 2) ? n : 0
        }

        for i in queries.indices {
            let index = queries[i][1]
            let value = queries[i][0]

            // if currnt value already even substract from evenSum
            if A[index].isMultiple(of: 2) {
                evenSum -= A[index]
            }
            // add value to currnt index of A
            A[index] += value
            if A[index].isMultiple(of: 2) { // check again if the current value is even after adding value add it to evenSum
                evenSum += A[index]
            }

            output[i] = evenSum // update output array with current evenSum
        }

        return output // return final output array
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(?)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.sumEvenAfterQueries([1, 2, 3, 4], [[1, 0], [-3, 1], [-4, 0], [2, 3]]), [8, 6, 2, 4])
    }
}

Tests.defaultTestSuite.run()
