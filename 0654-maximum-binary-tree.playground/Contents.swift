import UIKit
// 654: Maximum Binary Tree
// https://leetcode.com/problems/maximum-binary-tree/

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

// MARK: - Solution
// ================

class Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        let left = 0
        let right = nums.count - 1
        let root = buildTree(left, right, nums)
        return root
    }
    
    func buildTree(_ left: Int, _ right: Int, _ nums: [Int] ) -> TreeNode? {
        if left > right { return nil } // base case to break recursion
        
        var maxNum = nums[left]
        var index = left
        
        for i in left...right {
            if nums[i] > maxNum {
                maxNum = nums[i] // update maxNum to current max
                index = i // update index of current max
            }
        }
        
        let root = TreeNode(maxNum) // build root with max num
        root.left = buildTree(left, index-1, nums) // build left tree
        root.right = buildTree(index+1, right, nums) // build right tree
        return root
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    let tree = Solution().constructMaximumBinaryTree([3,2,1,6,0,5])
    let tree2 = Solution().constructMaximumBinaryTree([3,2,1])
    
    func testLeetcodeExample() {
        XCTAssertEqual(s.constructMaximumBinaryTree([3,2,1,6,0,5]), tree) // [6,3,5,nil,2,0,nil,nil,1]
    }
    
    func testLeetcodeExample2() {
        XCTAssertEqual(s.constructMaximumBinaryTree([3,2,1]), tree2) // [3,nil,2,nil,1]
    }
}

Tests.defaultTestSuite.run()




