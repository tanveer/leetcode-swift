import Foundation

// 278. First Bad Version
// https://leetcode.com/problems/first-bad-version

// MARK: - Solution
// ================
/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */
class VersionControl {
    var versions = [Int]()
    
    func isBadVersion(_ version: Int) -> Bool {
        // Note: The problem uses a start index of 1!
        return versions[version - 1] == 1
    }
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        if isBadVersion(left) {
            return left
        } else {
            return -1
        }
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log(n))
// Space Complexity: O(0)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        let versions = [0, 0, 0, 1, 1]
        s.versions = versions
        XCTAssertEqual(s.firstBadVersion(versions.count), 4)
    }
    
    func testLeetCodeExample2() {
        let versions = [1]
        s.versions = versions
        XCTAssertEqual(s.firstBadVersion(versions.count), 1)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let lastIsBad = [0, 0, 0, 0, 1]
        s.versions = lastIsBad
        XCTAssertEqual(s.firstBadVersion(lastIsBad.count), 5)
        
        let allAreBad = [1, 1, 1, 1, 1]
        s.versions = allAreBad
        XCTAssertEqual(s.firstBadVersion(allAreBad.count), 1)
        
        let noneAreBad = [0, 0, 0, 0, 0]
        s.versions = noneAreBad
        XCTAssertEqual(s.firstBadVersion(allAreBad.count), -1)
    }
}

Tests.defaultTestSuite.run()
