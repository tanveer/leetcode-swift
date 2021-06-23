import Foundation

// 1528. Shuffle String
// https://leetcode.com/problems/shuffle-string

// MARK: - Solution
// ================
class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        guard s.count == indices.count else { return "" }
        var chars = Array(s)
        let temp = Array(s)
        var index = 0


        for i in indices {
            chars[i] = temp[index]
            index += 1
        }

        return String(chars)
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
        XCTAssertEqual(s.restoreString("codeleet", [4, 5, 6, 7, 0, 2, 1, 3]), "leetcode")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.restoreString("abc", [0, 1, 2]), "abc")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.restoreString("aiohn", [3, 1, 4, 2, 0]), "nihao")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.restoreString("aaiougrt", [4, 0, 2, 6, 7, 3, 1, 5]), "arigatou")
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.restoreString("art", [1, 0, 2]), "rat")
    }
}

Tests.defaultTestSuite.run()
