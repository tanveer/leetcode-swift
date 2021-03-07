import Foundation

// 933. Number of Recent Calls
// https://leetcode.com/problems/number-of-recent-calls

// MARK: - Solution
// ================
class RecentCounter1 {
    private var recentRequest = [Int]()

    init() {}

    func ping(_ t: Int) -> Int {
        recentRequest.append(t)
        keepChecking { $0 < t - 3000 }
        return recentRequest.count
    }

    private func keepChecking(till: (Int) -> Bool) {
        while let topElement = recentRequest.first, till(topElement) == true {
            recentRequest.removeFirst()
        }
    }
}

// using queue
class RecentCounter2 {
    private var recentRequest = Queue<Int>()

    init() {}

    func ping(_ t: Int) -> Int {
        recentRequest.enqueue(t)
        recentRequest.keepDequeuing { $0 < t - 3000 }
        return recentRequest.count
    }
}

public struct Queue<T> {
    private var queue = [T]()

    public mutating func enqueue(_ val: T) {
        queue.append(val)
    }

    public mutating func dequeue() -> T? {
        guard count > 0 else {
            return nil
        }
        return queue.removeFirst()
    }

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return count == 0
    }

    public var front: T? {
        return queue.first
    }

    public mutating func keepDequeuing(till: (T) -> Bool) {
        while let topElement = front, till(topElement) == true {
            _ = self.dequeue()
        }
    }
}

/**
     * Your RecentCounter object will be instantiated and called as such:
     * let obj = RecentCounter()
     * let ret_1: Int = obj.ping(t)
 */

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let recentCounter = RecentCounter1()
        XCTAssertEqual(recentCounter.ping(1), 1)
        XCTAssertEqual(recentCounter.ping(100), 2)
        XCTAssertEqual(recentCounter.ping(3001), 3)
        XCTAssertEqual(recentCounter.ping(3002), 3)
    }

    func testLeetCodeExampleCall2() {
        let recentCounter = RecentCounter2()
        XCTAssertEqual(recentCounter.ping(1), 1)
        XCTAssertEqual(recentCounter.ping(100), 2)
        XCTAssertEqual(recentCounter.ping(3001), 3)
        XCTAssertEqual(recentCounter.ping(3002), 3)
    }
}

Tests.defaultTestSuite.run()
