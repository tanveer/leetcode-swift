import Foundation

// 150. Evaluate Reverse Polish Notation
// https://leetcode.com/problems/evaluate-reverse-polish-notation

// MARK: - Solution
// ================
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        guard !tokens.isEmpty else { return 0 }
        var stack = Stack()

        for token in tokens {
            if let op = Operator(rawValue: token) {
                let b = stack.pop()
                let a = stack.pop()
                stack.push(op.perform(a, b))
            }

            if let num = Int(token) {
                stack.push(num)
            }
        }
        return stack.pop()
    }
}

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"

    func perform(_ a: Int, _ b: Int) -> Int {
        switch self {
        case .add:
            return a + b
        case .subtract:
            return a - b
        case .multiply:
            return a * b
        case .divide:
            return a / b
        }
    }
}

struct Stack {
    private var stack = [Int]()

    mutating func push(_ value: Int) {
        stack.append(value)
    }

    mutating func pop() -> Int {
        return stack.popLast() ?? 0
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
        XCTAssertEqual(s.evalRPN(["2", "1", "+", "3", "*"]), 9)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.evalRPN(["4", "13", "5", "/", "+"]), 6)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]), 22)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.evalRPN([]), 0)
    }
}

Tests.defaultTestSuite.run()
