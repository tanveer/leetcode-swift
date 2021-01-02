import Foundation

// 938. Range Sum of BST
// https://leetcode.com/problems/range-sum-of-bst

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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        return dfs(root, L, R)
    }
    
    func dfs(_ root:TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        guard let root = root else { return sum }
        if low <= root.val && root.val <= high {
            sum += root.val
        }
        
        if low < root.val {
            sum += dfs(root.left, low, high)
        }
        if root.val < high {
            sum += dfs(root.right, low, high)
        }
        
        return sum
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
        XCTAssertEqual(s.rangeSumBST([10, 5, 15, 3, 7, nil, 18], 7, 15), 32)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.rangeSumBST([10, 5, 15, 3, 7, 13, 18, 1, nil, 6], 6, 10), 23)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.rangeSumBST(nil, 0, 0), 0)
    }
}

Tests.defaultTestSuite.run()
