import Foundation

// 617. Merge Two Binary Trees
// https://leetcode.com/problems/merge-two-binary-trees
// MARK: - Solution
// ================
class Solution {
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard t1 != nil || t2 != nil else { return nil }
        
        let sum = (t1?.val ?? 0) + (t2?.val ?? 0)
        
        let tree = TreeNode(sum)
        
        tree.left = mergeTrees(t1?.left, t2?.left)
        tree.right = mergeTrees(t1?.right, t2?.right)
        
        return tree
    }
        
    func mergeTrees_iterative(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard t1 != nil || t2 != nil else { return nil }

        var stack = Stack<(t1: TreeNode?, t2: TreeNode?)>()
        stack.push((t1: t1, t2: t2))
        
        while let node = stack.pop() {
            guard let node1 = node.t1, let node2 = node.t2 else { continue }
            
            node1.val += node2.val
            if node1.left == nil {
                node1.left = node2.left
            } else {
                stack.push((t1: node1.left, t2: node2.left))
            }
            
            if node1.right == nil {
                node1.right = node2.right
            } else {
                stack.push((t1: node1.right, t2: node2.right))
            }
        }
        
        return t1
    }
}

// Stack
struct Stack<T> {
    private var array = [T]()
    
    var count: Int {
        return array.count
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var top: T? {
        return array.last
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return isEmpty ? nil : array.popLast()
    }
}


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
        let tree1 = TreeNode(
            1,
            TreeNode(
                3,
                TreeNode(5),
                nil
            ),
            TreeNode(2)
        )
        
        let tree2 = TreeNode(
            2,
            TreeNode(
                1,
                nil,
                TreeNode(4)
            ),
            TreeNode(
                3,
                nil,
                TreeNode(7)
            )
        )
        
        let expected = TreeNode(
            3,
            TreeNode(
                4,
                TreeNode(5),
                TreeNode(4)
            ),
            TreeNode(
                5,
                nil,
                TreeNode(7)
            )
        )
        
        XCTAssertEqual(s.mergeTrees(tree1, tree2), expected)
    }
    
    func testAdditionalExamples() {
        XCTAssertEqual(s.mergeTrees_iterative(TreeNode(1), TreeNode(2)), TreeNode(3))
    }
}

Tests.defaultTestSuite.run()
