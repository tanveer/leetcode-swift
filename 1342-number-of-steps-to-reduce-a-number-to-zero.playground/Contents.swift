import Foundation

// 1342. Number of Steps to Reduce a Number to Zero
// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero

// MARK: - Solution
// ================
class Solution1 {
    func numberOfSteps(_ num: Int) -> Int {
        guard num > 0 else { return 0 }
        var original = num
        var totalSteps = 0

        while original != 0 {
            if original.isMultiple(of: 2) {
                original /= 2
                totalSteps += 1
            } else {
                original -= 1
                totalSteps += 1
            }
        }
        return totalSteps
    }
}

// shorter version of the solition1
class Solution2 {
    func numberOfSteps(_ num: Int) -> Int {
        guard num > 0 else { return 0 }
        var totalSteps = 0
        var original = num

        while original > 0 {
            original = num.isMultiple(of: 2) ? num / 2 : num - 1
            totalSteps += 1
        }

        return totalSteps
    }
}

// Recursive solution
class Solution3 {
    func numberOfSteps(_ num: Int) -> Int {
        if num < 2 {
            return num
        }
        return numberOfSteps(num / 2) + 1 + num % 2
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
    let s3 = Solution3()


    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.numberOfSteps(14), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.numberOfSteps(8), 4)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.numberOfSteps(123), 12)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.numberOfSteps(0), 0)
    }
}

Tests.defaultTestSuite.run()
