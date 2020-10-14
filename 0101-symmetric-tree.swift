//  Created by Tanveer Bashir on 10/14/20.
import UIKit

// 101. Symmetric Tree
// https://leetcode.com/problems/symmetric-tree/submissions/

// MARK: - Test Class
// ==================
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// MARK: - Test Case Leetcode Example
let symmetric = TreeNode(1, TreeNode(2), TreeNode(2))
symmetric.left?.left = TreeNode(3)
symmetric.left?.right = TreeNode(4)
symmetric.right?.left = TreeNode(4)
symmetric.right?.right = TreeNode(3)

// MARK: - Solution
// ================
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard isSymmetric(root?.left, root?.right) else { return false }
        
        var queue1 = [TreeNode?]()
        var queue2 = [TreeNode?]()
        
        queue1.append(root?.left)
        queue2.append(root?.right)
        
        while !queue1.isEmpty && !queue2.isEmpty {
            let left = queue1.removeFirst()
            let right = queue2.removeFirst()
            
            guard isSymmetric(left, right) else { return false }
            if left != nil {
                guard isSymmetric(left?.left, right?.right) else { return false }
                if left?.left != nil {
                    queue1.append(left?.left)
                    queue2.append(right?.right)
                }
                guard isSymmetric(left?.right, right?.left) else { return false }
                
                if left?.right != nil {
                    queue1.append(left?.right)
                    queue2.append(right?.left)
                }
            }
        }
        return true
    }
    
    func isSymmetric(_ p: TreeNode? , _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        if p?.val != q?.val { return false }
        return true
    }
    
    func isSymmetricRecursive(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        return isSymmetric(root?.left, root?.right)
    }
}


// MARK: - Test
// ============
import XCTest
class Tests: XCTestCase {
    
    let s = Solution()
    
    func testLeecodeExample() {
        XCTAssertTrue(s.isSymmetric(symmetric))
    }
    
    func testRecursiveSolution(){
        XCTAssertTrue(s.isSymmetricRecursive(symmetric))
    }
}

Tests.defaultTestSuite.run()
