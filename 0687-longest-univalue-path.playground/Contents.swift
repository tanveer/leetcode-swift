import Foundation

// 687. Longest Univalue Path
// https://leetcode.com/problems/longest-univalue-path

// Definition for a binary tree node.
public class TreeNode: ExpressibleByArrayLiteral {
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

            if valuesToAdd.isEmpty {
                return
            }

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
    var longestPath = 0

    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        traverse(root)
        return longestPath
    }

    func traverse(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let leftPath = traverse(root.left)
        let rightPath = traverse(root.right)
        var leftValue = 0
        var rightValue = 0

        if let left = root.left {
            leftValue = left.val == root.val ? leftPath + 1 : leftValue
        }

        if let right = root.right {
            rightValue = right.val == root.val ? rightPath + 1 : rightValue
        }

        longestPath = max(longestPath, leftValue + rightValue)

        return max(leftValue, rightValue)
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) // numbers of node in the tree
// Space Complexity: O(h) // is the height of the tree

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.longestUnivaluePath([5, 4, 5, 1, 1, 5]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.longestUnivaluePath([1, 4, 5, 4, 4, 5]), 2)
    }
}

Tests.defaultTestSuite.run()
