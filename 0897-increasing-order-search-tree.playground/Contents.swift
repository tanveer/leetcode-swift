import Foundation

// 897. Increasing Order Search Tree
// https://leetcode.com/problems/increasing-order-search-tree

// MARK: - Solution
// ================
class Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        var values = [Int]()

        inOrderTraversal(root, &values)
        let node = TreeNode(0)
        var curr = node

        for value in values {
            curr.right = TreeNode(value)
            curr = curr.right!
        }

        return node.right
    }

    func inOrderTraversal(_ node: TreeNode?, _ values: inout [Int]) {
        guard let node = node else { return }

        inOrderTraversal(node.left, &values)
        values.append(node.val)
        inOrderTraversal(node.right, &values)
    }
}

// Definition for a binary tree node.
public class TreeNode: ExpressibleByArrayLiteral, ExpressibleByIntegerLiteral {
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

    // Allow left and right leaves to be specified as integers, i.e. TreeNode(1, 2, 3) vs TreeNode(1, TreeNode(2), TreeNode(3))
    public required convenience init(integerLiteral value: Int) {
        self.init(value)
    }

    // Allow initialization as: let treeNode: TreeNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int?...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        guard let rootNodeVal = firstVal else { fatalError("Root node's value cannot be nil") }
        self.init(rootNodeVal)

        var queueArray: [TreeNode] = [self]
        var valuesToAdd = Array(arrayLiteral.dropFirst())

        while !queueArray.isEmpty, !valuesToAdd.isEmpty {
            let node = queueArray.removeFirst()

            if let leftVal = valuesToAdd.removeFirst() {
                node.left = TreeNode(leftVal)
                queueArray.append(node.left!)
            }

            guard !valuesToAdd.isEmpty else { return }
            if let rightVal = valuesToAdd.removeFirst() {
                node.right = TreeNode(rightVal)
                queueArray.append(node.right!)
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
        if p == nil, q == nil {
            return true
        } else if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }

    private func diagram(for node: TreeNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.val)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.val)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(h)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let before: TreeNode = [5, 3, 6, 2, 4, nil, 8, 1, nil, nil, nil, 7, 9]
        let converted = s.increasingBST(before)
        let expected: TreeNode = [1, nil, 2, nil, 3, nil, 4, nil, 5, nil, 6, nil, 7, nil, 8, nil, 9]
        XCTAssertEqual(expected, converted)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.increasingBST([5, 1, 7]), [1, nil, 5, nil, 7])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertNil(s.increasingBST(nil))
    }
}

Tests.defaultTestSuite.run()
