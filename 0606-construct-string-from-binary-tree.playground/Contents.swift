import Foundation

// 606. Construct String from Binary Tree
// https://leetcode.com/problems/construct-string-from-binary-tree
// MARK: - Solution
// ================
// Definition for a binary tree node.

class Solution {
    func tree2str(_ t: TreeNode?) -> String {
        guard let node = t else { return ""}
        
        var result = node.val.description
        if node.left != nil {
            let text = tree2str(node.left)
            result += "(\(text))"
        }
        if node.right != nil{
            if node.left == nil {
                result += "()"
            }
            let text = tree2str(node.right)
            result += "(\(text))"
        }
        return result
    }
}

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


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(log(n))

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.tree2str([1, 2, 3, 4]), "1(2(4))(3)")
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.tree2str([1, 2, 3, nil, 4]), "1(2()(4))(3)")
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.tree2str(nil), "")
        XCTAssertEqual(s.tree2str([1, 2, nil, 3, 4]), "1(2(3)(4))")
    }
}

Tests.defaultTestSuite.run()
