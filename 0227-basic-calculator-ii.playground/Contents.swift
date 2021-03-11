import Foundation

// 227. Basic Calculator II
// https://leetcode.com/problems/basic-calculator-ii

// MARK: - Solution
// ================
class Solution {
    func calculate(_ s: String) -> Int {
        var num = 0
        var stack = [Int]()
        var op: Character = "+"

        for char in "\(s)+" where char != " " {
            if let number = char.wholeNumberValue {
                num = num * 10 + number
            } else {
                switch op {
                case "+":
                    stack.append(num)
                case "-":
                    stack.append(-num)
                case "*":
                    stack.append(stack.removeLast() * num)
                case "/":
                    stack.append(stack.removeLast() / num)
                default:
                    break
                }

                num = 0
                op = char
            }
        }
        return stack.reduce(0, +)
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
        XCTAssertEqual(s.calculate("3+2*2"), 7)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.calculate(" 3/2 "), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.calculate(" 3+5 / 2 "), 5)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.calculate("1-1+1"), 1)
    }

    func testLeetCodeTest2() {
        XCTAssertEqual(s.calculate("14/3*2"), 8)
    }

    func testLeetCodeTest3() {
        XCTAssertEqual(s.calculate("1+2*5/3+6/4*2"), 6)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.calculate("1+1"), 2)
    }
}

Tests.defaultTestSuite.run()
