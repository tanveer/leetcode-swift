import Foundation

// 232. Implement Queue using Stacks
// https://leetcode.com/problems/implement-queue-using-stacks

// MARK: - Solution
// ================
class MyQueue {

    /** Initialize your data structure here. */
    var enqueueStack = Stack<Int>()
    var dequeueStack = Stack<Int>()

    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        while let pop = dequeueStack.pop() {
            enqueueStack.push(pop)
        }
        enqueueStack.push(x)
    }

    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        while let pop = enqueueStack.pop() {
            dequeueStack.push(pop)
        }
        return dequeueStack.pop()!
    }

    /** Get the front element. */
    func peek() -> Int {
        while let element = enqueueStack.pop() {
            dequeueStack.push(element)
        }
        return dequeueStack.peek()!
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
}

struct Stack<T> {
    private var elements = [T]()

    init() {}

    var isEmpty: Bool {
        return elements.isEmpty
    }

    func peek() -> T? {
        return elements.last
    }

    mutating func push(_ element: T) {
        elements.append(element)
    }

    @discardableResult
    mutating func pop() -> T? {
        return elements.popLast()
    }

    var count: Int {
        return elements.count
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let myQueue = MyQueue()
        myQueue.push(1)
        myQueue.push(2)
        XCTAssertEqual(myQueue.peek(), 1)
        XCTAssertEqual(myQueue.pop(), 1)
        XCTAssertFalse(myQueue.empty())

        XCTAssertEqual(myQueue.pop(), 2)
        XCTAssertTrue(myQueue.empty())
    }
}

Tests.defaultTestSuite.run()

