import Foundation

// 669. Trim a Binary Search Tree
// https://leetcode.com/problems/trim-a-binary-search-tree

// MARK: - Solution
// ================
// Definition for a binary tree node.
public class TreeNode: ExpressibleByArrayLiteral {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    // Allow initialization as: let treeNode: TreeNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int?...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        guard let rootNodeVal = firstVal else { fatalError("Root node's value cannot be nil") }
        self.init(rootNodeVal)
        
        var queueArray: [TreeNode?] = [self]
        var valuesToAdd = Array(arrayLiteral.dropFirst())
        
        while !queueArray.isEmpty && !valuesToAdd.isEmpty {
            let node = queueArray.removeFirst()
            
            if let leftVal = valuesToAdd.removeFirst() {
                node?.left = TreeNode(leftVal)
            }
            queueArray.append(node?.left)
            
            guard !valuesToAdd.isEmpty else { return }
            if let rightVal = valuesToAdd.removeFirst() {
                node?.right = TreeNode(rightVal)
            }
            queueArray.append(node?.right)
        }
    }
}

// This is to allow XCTAssertEqual to compare two TreeNodes
extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return isSameTree(lhs, rhs)
    }
    
    static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
    }
}

class Solution {
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        return trim(root, low, high)
    }
    
    func trim(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val > high {
            return trim(root.left, low, high)
        } else if root.val < low {
            return trim(root.right, low, high)
        } else {
            root.left = trim(root.left, low, high)
            root.right = trim(root.right, low, high)
            return root
        }
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
        XCTAssertEqual(s.trimBST([1, 0, 2], 1, 2), [1, nil, 2])
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.trimBST([1], 1, 2), [1])
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.trimBST([1, nil, 2], 1, 3), [1, nil, 2])
    }
    
    func testLeetCodeExample5() {
        XCTAssertEqual(s.trimBST([1, nil, 2], 2, 4), [2])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.trimBST(nil, 0, 0), nil)
    }
}

Tests.defaultTestSuite.run()

