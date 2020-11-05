import Foundation

// 225. Implement Stack using Queues
// https://leetcode.com/problems/implement-stack-using-queues

// MARK: - Solution
// ================
class MyStack {
    private var queue = Queue<Int>()

    init() {}

    func push(_ x: Int) {
        var count = queue.count
        queue.enqueue(x)

        //Rotate the queue
        while count > 0 {
            queue.enqueue(queue.dequeue())
            count -= 1
        }
    }

    func pop() -> Int {
        return queue.dequeue()
    }

    func top() -> Int {
        guard let top = queue.peek() else { return -1 }
        return top
    }

    func empty() -> Bool {
        return queue.isEmpty()
    }
}

class Queue<T>: CustomStringConvertible {
    private var elements = [T]()

    var description: String {
        return "\(elements)"
    }

    var count: Int {
        return elements.count
    }

    func enqueue(_ value: T) {
        elements.append(value)
    }

    func dequeue() -> T {
        return elements.removeFirst()
    }

    func peek() -> T? {
        guard let first = elements.first else { return nil }
        return first
    }

    func isEmpty() -> Bool {
        return elements.isEmpty
    }
}
/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
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
        let myStack = MyStack()
        myStack.push(1)
        myStack.push(2)
        XCTAssertEqual(myStack.top(), 2)
        XCTAssertEqual(myStack.pop(), 2)
        XCTAssertFalse(myStack.empty())
    }
}

Tests.defaultTestSuite.run()

