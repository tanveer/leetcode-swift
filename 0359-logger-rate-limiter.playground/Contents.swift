import Foundation

// 359. Logger Rate Limiter
// https://leetcode.com/problems/logger-rate-limiter

// MARK: - Solution
// ================
class Logger {
    private var messages: [String: Int]
    /** Initialize your data structure here. */
    init() {
        messages = [:]
    }

    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
     If this method returns false, the message will not be printed.
     The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        guard let previousTimestamp = messages[message] else {
            messages[message] = timestamp
            return true
        }

        if (timestamp - previousTimestamp) >= 10 {
            messages[message] = timestamp
            return true
        }
        return false
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)
