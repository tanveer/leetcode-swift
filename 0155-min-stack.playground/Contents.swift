import Foundation

// 155. Min Stack
// https://leetcode.com/problems/min-stack

// MARK: - Solution
// ================
class MinStack {
    private var stack = Stack<(val: Int, min: Int)>()

    func push(_ val: Int) {
        if stack.isEmpty {
            stack.push((val, val))
            return
        }
        stack.push((val, min(val, stack.top.min)))
    }

    func pop() {
        stack.pop()
    }

    func top() -> Int {
        return stack.top.val
    }

    func getMin() -> Int {
        return stack.top.min
    }
}

struct Stack<Element> {
    private var storage: [Element] = []

    // return count of stack
    var count: Int {
        return storage.count
    }

    var top: Element {
        return peek()
    }

    // check if stack is empty or not
    var isEmpty: Bool {
        return storage.isEmpty
    }

    // push an element at the top of the stack
    mutating func push(_ value: Element) {
        storage.append(value)
    }

    // show top most element in the stack
    func peek() -> Element {
        return storage[count - 1]
    }

    // remove top most element in the stack
    mutating func pop() -> Element {
        return storage.removeLast()
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
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        XCTAssertEqual(minStack.getMin(), -3) // return -3
        minStack.pop()
        XCTAssertEqual(minStack.top(), 0)     // return 0
        XCTAssertEqual(minStack.getMin(), -2) // return -2
    }

    func testAdditionalExamples() {
        let minStack = MinStack()
        minStack.push(-2)
        minStack.push(0)
        minStack.push(-3)
        XCTAssertEqual(minStack.getMin(), -3) // return -3
        minStack.pop()
        XCTAssertEqual(minStack.top(), 0)     // return 0
        XCTAssertEqual(minStack.getMin(), -2) // return -2
    }
}

Tests.defaultTestSuite.run()
