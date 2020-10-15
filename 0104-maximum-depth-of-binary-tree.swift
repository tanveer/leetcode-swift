// Created by Tanveer Bashir on 10/15/20.
//

// 104. Maximum Depth of a Binary Tree
// https://leetcode.com/problems/maximum-depth-of-binary-tree/

// MARK: - Solution
// ================

/// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var queue = [TreeNode?]()
        queue.append(root);
        var depth = 0
        
        while !queue.isEmpty {
            var queueCount = queue.count
            while queueCount > 0 {
                var node = queue.removeFirst()
                if (node?.left != nil) { queue.append(node?.left) }
                if (node?.right != nil) { queue.append(node?.right) }
                
                queueCount -= 1
            }
            depth += 1
        }
        return depth
    }
    
    func recursiveSolution(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            return max(maxDepth(root?.right), maxDepth(root?.left)) + 1
        }
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        let right = TreeNode(20, TreeNode(15), TreeNode(7))
        let tree = TreeNode(3, TreeNode(9), right)
        XCTAssertEqual(s.maxDepth(tree), 3)
    }
    
    func testRecusiveSolution() {
        XCTAssertEqual(s.recursiveSolution(TreeNode(5, nil, TreeNode(3))), 2)
    }
    
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxDepth(TreeNode(5)), 1)
        XCTAssertEqual(s.maxDepth(TreeNode(5, nil, TreeNode(3))), 2)
    }
}

Tests.defaultTestSuite.run()
