import Foundation

// 970. Powerful Integers
// https://leetcode.com/problems/powerful-integers

// MARK: - Solution
// ================
class Solution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var set = Set<Int>()
        var numsA = [1]
        var numsB = [1]

        if x > 1 {
            var val = x
            while val < bound {
                numsA.append(val)
                val *= x
            }
        }

        if y > 1 {
            var val = y
            while val < bound {
                numsB.append(val)
                val *= y
            }
        }

        for a in numsA {
            for b in numsB where a + b <= bound {
                set.insert(a + b)
            }
        }

        return [Int](set).sorted()
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.powerfulIntegers(2, 3, 10), [2, 3, 4, 5, 7, 9, 10])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.powerfulIntegers(3, 5, 15), [2, 4, 6, 8, 10, 14])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.powerfulIntegers(0, 0, 0), [])
    }
}

Tests.defaultTestSuite.run()
