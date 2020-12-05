import Foundation

// 653. Two Sum IV - Input is a BST
// https://leetcode.com/problems/two-sum-iv-input-is-a-bst

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
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard root != nil else { return false }
        
        var set = Set<Int>()
        var queue = Queue<TreeNode?>()
        queue.enqueue(root)
        
        while !queue.isEmpty {
            if let node = queue.dequeue() {
                if set.contains(k - node.val) {
                    return true
                } else {
                    set.insert(node.val)
                }
                queue.enqueue(node.right)
                queue.enqueue(node.left)
            }
        }
        
        return false
    }
    
    func findTarget_recursive(_ root: TreeNode?, _ k: Int) -> Bool {
        var set = Set<Int>()
        return findTarget(root, k, &set)
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int, _ set: inout Set<Int>) -> Bool {
        if root == nil { return false }
        let value = k - root!.val
        if set.contains(value) {
            return true
        }
        set.insert(root!.val)
        return findTarget(root?.left, k, &set) || findTarget(root?.right, k, &set)
    }
}

struct Queue<Element> {
    private var storage = [Element]()
    
    mutating func enqueue(_ x: Element) {
        storage.append(x)
    }
    
    var count: Int {
        return storage.count
    }
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func peek() -> Element? {
        return storage.first
    }
    
    mutating func dequeue() -> Element {
        return storage.removeFirst()
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
        XCTAssertTrue(s.findTarget([5, 3, 6, 2, 4, nil, 7], 9))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.findTarget([5, 3, 6, 2, 4, nil, 7], 28))
    }
    
    func testLeetCodeExample3() {
        XCTAssertTrue(s.findTarget([2, 1, 3], 4))
    }
    
    func testLeetCodeExample4() {
        XCTAssertFalse(s.findTarget([2, 1, 3], 1))
    }
    
    func testLeetCodeExample5() {
        XCTAssertTrue(s.findTarget([2, 1, 3], 3))
    }
    
    func testLeetCodeExample6() {
        XCTAssertTrue(s.findTarget_recursive([2, 1, 3], 3))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.findTarget(nil, 0))
    }
    
    func testAdditionalExamples1() {
        XCTAssertFalse(s.findTarget_recursive(nil, 0))
    }
}

Tests.defaultTestSuite.run()

