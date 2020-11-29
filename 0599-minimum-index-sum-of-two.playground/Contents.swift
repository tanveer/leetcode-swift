import Foundation

// 599. Minimum Index Sum of Two Lists
// https://leetcode.com/problems/minimum-index-sum-of-two-lists

// MARK: - Solution
// ================
class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var maxIndex = Int.max
        var result: [String] = []
        var map = [String: Int]()
        
        for (index, str) in list1.enumerated() {
            map[str] = index
        }
        
        for (index, str) in list2.enumerated()  {
            if let index1 = map[str] {
                let sum = index + index1
                if maxIndex > sum {
                    maxIndex = sum
                    result = [str]
                } else if maxIndex == sum {
                    result.append(str)
                }
            }
        }
        
        return result
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]), ["Shogun"])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["KFC", "Shogun", "Burger King"]), ["Shogun"])
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["KFC", "Burger King", "Tapioca Express", "Shogun"]), ["KFC", "Burger King", "Tapioca Express", "Shogun"])
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["KNN", "KFC", "Burger King", "Tapioca Express", "Shogun"]), ["KFC", "Burger King", "Tapioca Express", "Shogun"])
    }
    
    func testLeetCodeExample5() {
        XCTAssertEqual(s.findRestaurant(["KFC"], ["KFC"]), ["KFC"])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findRestaurant([], []), [])
    }
}

Tests.defaultTestSuite.run()
