
//
//  Created by Tanveer Bashir on 10/13/20.
//
import UIKit
import XCTest

// 100. Same Tree
// https://leetcode.com/problems/same-tree/

// MARK: - Node
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

let tree1 = TreeNode(1, TreeNode(2), TreeNode(1))
let tree2 = TreeNode(1, TreeNode(1), TreeNode(2))
let tree3 = TreeNode(1, TreeNode(2), TreeNode(3))
let tree4 = TreeNode(1, TreeNode(2), TreeNode(3))

// MARK: - Solution
// ================
class Solution {
    func isSameTree(_ leftTree: TreeNode?, _ rightTree: TreeNode?) -> Bool {
        guard isSame(leftTree, rightTree) else { return false }

        var leftQueue = [TreeNode?]()
        var rightQueue = [TreeNode?]()
        leftQueue.append(leftTree)
        rightQueue.append(rightTree)

        while !leftQueue.isEmpty && !rightQueue.isEmpty {
            let left = leftQueue.removeFirst()
            let right = rightQueue.removeFirst()

            guard isSame(left, right) else { return false }

            if left != nil {
                guard isSame(left?.left, right?.left) else { return false }
                if left?.left != nil {
                    leftQueue.append(left?.left)
                    rightQueue.append(right?.left)
                }

                guard isSame(left?.right, right?.right) else { return false }
                if left?.right != nil {
                    leftQueue.append(left?.right)
                    rightQueue.append(right?.right)
                }
            }
        }
        return true
    }

    func isSame(_ leftNode: TreeNode? , _ rightNode: TreeNode?) -> Bool {
        if leftNode == nil && rightNode == nil { return true }
        if leftNode == nil || rightNode == nil { return false }
        if leftNode?.val != rightNode?.val { return false }
        return true
    }
}

// MARK: - Test
// ============
class Tests: XCTestCase {
    let s = Solution()

    func testLeecodeExample() {
        XCTAssertTrue(s.isSameTree(tree3, tree4))
    }

    func testLeetcode(){
        XCTAssertFalse(s.isSameTree(tree1, tree2))
    }
}

Tests.defaultTestSuite.run()

