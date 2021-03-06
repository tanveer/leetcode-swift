import Foundation

// 888. Fair Candy Swap
// https://leetcode.com/problems/fair-candy-swap

// MARK: - Solution
// ================
class Solution {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        let sumA = A.reduce(0, +)
        let sumB = B.reduce(0, +)
        let setB = Set<Int>(B)

        let target = (sumA + sumB) / 2
        let delta = target - sumA
        var fairSwaps: [Int] = [0, 0]

        for candy in A {
            let b = candy + delta
            if setB.contains(b) {
                fairSwaps[0] = candy
                fairSwaps[1] = b
                return fairSwaps
            }
        }

        return fairSwaps
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(A + B)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.fairCandySwap([1, 1], [2, 2]), [1, 2])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.fairCandySwap([1, 2], [2, 3]), [1, 2])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.fairCandySwap([2], [1, 3]), [2, 3])
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.fairCandySwap([1, 2, 5], [2, 4]), [5, 4])
    }
}

Tests.defaultTestSuite.run()
