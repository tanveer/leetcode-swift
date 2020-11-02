import Foundation

// 155. Min Stack
// https://leetcode.com/problems/min-stack

// MARK: - Stack
// =============

struct Stack<Element> {
    private var stack = [Element]()

    mutating func push(_ x: Element) {
        stack.append(x)
    }

    func isEmpty() -> Bool {
        return stack.isEmpty
    }

    func peek() -> Element {
        return stack[stack.count - 1]
    }

    mutating func pop() -> Element {
        return stack.remove(at: stack.count - 1)
    }
}

// MARK: - Solution
// ================
class MinStack {
    /** initialize your data structure here. */
    private var stack = Stack<Int>()
    private var minStack = Stack<Int>()

    func push(_ x: Int) {
        stack.push(x)
        if minStack.isEmpty() {
            minStack.push(x)
        } else if x <= minStack.peek() {
            minStack.push(x)
        }
    }

    func pop() {
        let pop = stack.pop()
        if pop == minStack.peek() {
            minStack.pop()
        }
    }

    func top() -> Int {
        return stack.peek()
    }

    func getMin() -> Int {
        return minStack.peek()
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 *
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {

    // LeetCode Examples
    func testLeetCodeExampleCall() {
        // Your MinStack object will be instantiated and called as such:
        // let obj = MinStack()
        // obj.push(x)
        // obj.pop()
        // let ret_3: Int = obj.top()
        // let ret_4: Int = obj.getMin()
    }

    // Additional Examples
    func testAdditionalExamples() {
        // {{ADDITIONAL_EXAMPLES}}
    }
}

Tests.defaultTestSuite.run()
