import Foundation

// 1465. Maximum Area of a Piece of Cake After Horizontal and Vertical Cuts
// https://leetcode.com/problems/maximum-area-of-a-piece-of-cake-after-horizontal-and-vertical-cuts

// MARK: - Solution
// ================
class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        let horizontalCutSorted = (horizontalCuts + [0, h]).sorted()
        let verticalCutsSorted = (verticalCuts + [0, w]).sorted()

        var heightDifference = Int.min
        var widthDifference = Int.min

        for (index, _) in horizontalCutSorted.enumerated().dropLast() {
            let maxHorizontalCut = (horizontalCutSorted[index + 1] - horizontalCutSorted[index])
            heightDifference = max(maxHorizontalCut, heightDifference)
        }

        for (index, _) in verticalCutsSorted.enumerated().dropLast() {
            let maxVeritalCut = (verticalCutsSorted[index + 1] - verticalCutsSorted[index])
            widthDifference = max(maxVeritalCut, widthDifference)
        }

        let mod = Int(pow(CGFloat(10), CGFloat(9))) + 7
        return heightDifference * widthDifference % mod
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(N⋅log(N)+M⋅log(M))
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.maxArea(5, 4, [1, 2, 4], [1, 3]), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxArea(5, 4, [3, 1], [1]), 6)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxArea(5, 4, [3], [3]), 9)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxArea(0, 0, [], []), 0)
    }
}

Tests.defaultTestSuite.run()
