import Foundation

// 173. Binary Search Tree Iterator
// https://leetcode.com/problems/binary-search-tree-iterator

// MARK: - Solution
// ================
class BSTIterator {
    
    var stack: [Int] = []
    var index = -1
    
    init(_ root: TreeNode?) {
        inorderTraversal(root)
    }
    
    
    func next() -> Int {
        index += 1
        return stack[index]
        
    }
    
    func hasNext() -> Bool {
        return  index + 1 < stack.count
    }
    
    private func inorderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        
        inorderTraversal(root.left)
        stack.append(root.val)
        inorderTraversal(root.right)
    }
}

class BSTIterator2 {
    
    var stack: [TreeNode?] = []
    
    init(_ root: TreeNode?) {
        self.leftMostinorderTraversal(root)
    }
    
    func next() -> Int {
        let lastNode = stack.removeLast()
        if lastNode?.right != nil {
            leftMostinorderTraversal(lastNode?.right)
        }
        return lastNode?.val ??  -1
    }
    
    func hasNext() -> Bool {
        return  stack.count > 0
    }
    
    private func leftMostinorderTraversal(_ root: TreeNode?) {
        var root = root
        while root != nil {
            self.stack.append(root)
            root = root?.left
        }
    }
}


/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */


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
                queueArray.append(node?.left)
            }
            
            guard !valuesToAdd.isEmpty else { return }
            if let rightVal = valuesToAdd.removeFirst() {
                node?.right = TreeNode(rightVal)
                queueArray.append(node?.right)
            }
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
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let bstIterator = BSTIterator([7, 3, 15, nil, nil, 9, 20])
        XCTAssertEqual(bstIterator.next(), 3)   // return 3
        XCTAssertEqual(bstIterator.next(), 7)   // return 7
        XCTAssertTrue(bstIterator.hasNext())    // return True
        XCTAssertEqual(bstIterator.next(), 9)   // return 9
        XCTAssertTrue(bstIterator.hasNext())    // return True
        XCTAssertEqual(bstIterator.next(), 15)  // return 15
        XCTAssertTrue(bstIterator.hasNext())    // return True
        XCTAssertEqual(bstIterator.next(), 20)  // return 20
        XCTAssertFalse(bstIterator.hasNext())   // return False
    }
    
    // LeetCode Tests
    func testLeetCodeTest1() {
        let tree = TreeNode(2, TreeNode(1), nil)
        let bstIterator = BSTIterator(tree)
        XCTAssertTrue(bstIterator.hasNext())
        XCTAssertEqual(bstIterator.next(), 1)
        XCTAssertTrue(bstIterator.hasNext())
        XCTAssertEqual(bstIterator.next(), 2)
        XCTAssertFalse(bstIterator.hasNext())
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let bstIterator2 = BSTIterator([2, 1, 3])
        XCTAssertTrue(bstIterator2.hasNext())
        XCTAssertEqual(bstIterator2.next(), 1)
        XCTAssertTrue(bstIterator2.hasNext())
        XCTAssertEqual(bstIterator2.next(), 2)
        XCTAssertTrue(bstIterator2.hasNext())
        XCTAssertEqual(bstIterator2.next(), 3)
        XCTAssertFalse(bstIterator2.hasNext())
    }
}

Tests.defaultTestSuite.run()
