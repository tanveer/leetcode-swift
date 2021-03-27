import Foundation

// 1089. Duplicate Zeros
// https://leetcode.com/problems/duplicate-zeros

// MARK: - Solution
// ================
class Solution1 {
    func duplicateZeros(_ arr: inout [Int]) {
        var index = 0
        while index < arr.count {
            if arr[index] == 0 {
                arr.removeLast()
                arr.insert(0, at: index)
                index += 1
            }
            index += 1
        }
    }
}

class Solution2 {
    func duplicateZeros(_ arr: inout [Int]) {
        var zeros = arr.reduce(0) { $0 + ($1 == 0 ? 1 : 0) }
        var i = arr.count + zeros - 1

        while i >= 0 {
            guard zeros != 0 else { return }
            let digit = arr[i - zeros]

            if digit == 0 {
                if i < arr.count {
                    arr[i] = digit
                }
                i -= 1
                zeros -= 1
            }

            if i < arr.count {
                arr[i] = digit
            }
            i -= 1
        }
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        var inoutInput = [1, 0, 2, 3, 0, 4, 5, 0]
        s1.duplicateZeros(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 0, 0, 2, 3, 0, 0, 4])
    }

    func testLeetCodeExample2() {
        var inoutInput = [1, 2, 3]
        s1.duplicateZeros(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 2, 3])
    }

    func testLeetCodeExample3() {
        var inoutInput = [1, 0, 2, 3, 0, 4, 5, 0]
        s2.duplicateZeros(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 0, 0, 2, 3, 0, 0, 4])
    }

    func testLeetCodeExample4() {
        var inoutInput = [1, 2, 3]
        s2.duplicateZeros(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 2, 3])
    }
}

Tests.defaultTestSuite.run()
