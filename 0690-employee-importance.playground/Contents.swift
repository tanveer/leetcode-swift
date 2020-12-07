import Foundation

// 690. Employee Importance
// https://leetcode.com/problems/employee-importance

// MARK: - Solution
// ================

// Definition for Employee.
public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}

class Solution {
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        var map = [Int: Employee]()
        var ans = 0
        
        for e in employees {
            map[e.id] = e
        }
        
        func helper(_ map: [Int: Employee], _ id: Int) {
            guard let emp = map[id] else { return }
            
            ans += emp.importance
            for sub in emp.subordinates {
                helper(map, sub)
            }
        }
        
        helper(map, id)
        
        return ans
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let emp1 = Employee(1, 5, [2,3])
    let emp2 = Employee(2, 3, [])
    let emp3 = Employee(3, 3, [])
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.getImportance([emp1, emp2, emp3], 1), 11)
    }
    
    
}

Tests.defaultTestSuite.run()

