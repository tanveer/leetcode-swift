import Foundation

// 393. UTF-8 Validation
// https://leetcode.com/problems/utf-8-validation

// MARK: - Solution
// ================
class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        var nBytes = 0
        let mask1 = 1 << 7
        let mask2 = 1 << 6

        for num in data {
            var mask = 1 << 7
            if nBytes == 0 {
                while mask & num != 0 {
                    nBytes += 1
                    mask = mask >> 1
                }

                if nBytes == 0 {
                    continue
                }

                if nBytes == 1 || nBytes > 4 {
                    return false
                }
            } else {
                if !(num & mask1 != 0 && mask2 & num == 0) {
                    return false
                }
            }
            nBytes -= 1
        }

        return nBytes == 0
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
        XCTAssertTrue(s.validUtf8([197, 130, 1]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.validUtf8([235, 140, 4]))
    }
}

Tests.defaultTestSuite.run()
