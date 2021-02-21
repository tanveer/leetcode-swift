import Foundation

// 836. Rectangle Overlap
// https://leetcode.com/problems/rectangle-overlap

// MARK: - Solution
// ================
class Solution1 {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        let xRange1 = rec1[0]..<rec1[2]
        let yRange1 = rec1[1]..<rec1[3]
        let xRange2 = rec2[0]..<rec2[2]
        let yRange2 = rec2[1]..<rec2[3]
        return xRange1.overlaps(xRange2) && yRange1.overlaps(yRange2)
    }
}

class Solution2 {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        return  min(rec1[2], rec2[2]) > max(rec1[0], rec2[0]) && min(rec1[3], rec2[3]) > max(rec1[1], rec2[1])
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s1.isRectangleOverlap([0, 0, 2, 2], [1, 1, 3, 3]))
        XCTAssertTrue(s2.isRectangleOverlap([0, 0, 2, 2], [1, 1, 3, 3]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s1.isRectangleOverlap([0, 0, 1, 1], [1, 0, 2, 1]))
        XCTAssertFalse(s2.isRectangleOverlap([0, 0, 1, 1], [1, 0, 2, 1]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s1.isRectangleOverlap([0, 0, 1, 1], [2, 2, 3, 3]))
        XCTAssertFalse(s2.isRectangleOverlap([0, 0, 1, 1], [2, 2, 3, 3]))
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertTrue(s1.isRectangleOverlap([7, 8, 13, 15], [10, 8, 12, 20]))
        XCTAssertTrue(s2.isRectangleOverlap([7, 8, 13, 15], [10, 8, 12, 20]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s1.isRectangleOverlap([0, 0, 0, 0], [0, 0, 0, 0]))
        XCTAssertFalse(s2.isRectangleOverlap([0, 0, 0, 0], [0, 0, 0, 0]))
    }
}

Tests.defaultTestSuite.run()
