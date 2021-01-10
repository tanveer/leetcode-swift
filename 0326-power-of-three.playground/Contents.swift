import Foundation

// 326. Power of Three
// https://leetcode.com/problems/power-of-three

// MARK: - Solution
// ================
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n != 1 else { return true }
        return n == 0 || n % 3 != 0 ? false : isPowerOfThree(n / 3)
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
        XCTAssertTrue(s.isPowerOfThree(27))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.isPowerOfThree(0))
    }
    
    func testLeetCodeExample3() {
        XCTAssertTrue(s.isPowerOfThree(9))
    }
    
    func testLeetCodeExample4() {
        XCTAssertFalse(s.isPowerOfThree(45))
    }
    
    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertTrue(s.isPowerOfThree(1))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let num = NSDecimalNumber(decimal: pow(3, 39)).intValue  // 39 = 4052555153018976267, 40 overflows
        XCTAssertTrue(s.isPowerOfThree(num))
    }
}

Tests.defaultTestSuite.run()
