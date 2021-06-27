import Foundation

// 1370. Increasing Decreasing String
// https://leetcode.com/problems/increasing-decreasing-string

// MARK: - Solution
// ================
class Solution {
    func sortString(_ s: String) -> String {
        var map = s.reduce(into: [:]) { dict, c in
            dict[c, default: 0] += 1
        }

        let keys = map.keys.sorted() + map.keys.sorted().reversed()

        var output = ""
        while output.count < s.count {
            for key in keys where map[key] != nil && map[key]! > 0 {
                output.append(String(key))
                map[key]! -= 1
            }
        }
        return output
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlogn) because of sorting
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.sortString("aaaabbbbcccc"), "abccbaabccba")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.sortString("rat"), "art")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.sortString("leetcode"), "cdelotee")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.sortString("ggggggg"), "ggggggg")
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.sortString("spo"), "ops")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.sortString("vnggnv"), "gnvvng")
    }
}

Tests.defaultTestSuite.run()
