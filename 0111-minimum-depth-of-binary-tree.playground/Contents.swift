import Foundation

// 111. Minimum Depth of Binary Tree
// https://leetcode.com/problems/minimum-depth-of-binary-tree

// MARK: - Solution
// ================
class Solution1 {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = minDepth(root.left)
        let right = minDepth(root.right)

        if left == 0 || right == 0 {
            return left + right + 1
        }
        return min(left, right) + 1
    }
}

class Solution2 {
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }

        var queue = [TreeNode?]()
        queue.append(root)
        var depth = 0

        while !queue.isEmpty {
            var queueCount = queue.count
            while queueCount > 0 {
                let node = queue.removeFirst()
                if node?.left == nil, node?.right == nil {
                    depth += 1
                    return depth
                }

                if node?.left != nil { queue.append(node?.left) }
                if node?.right != nil { queue.append(node?.right) }
                queueCount -= 1
            }
            depth += 1
        }
        return depth
    }
}

// MARK: - Supporting Code: Definition for a binary tree node
// ==========================================================
public class TreeNode: ExpressibleByArrayLiteral, ExpressibleByIntegerLiteral, Equatable {
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

    // ExpressibleByIntegerLiteral
    // Allow left and right leaves to be specified as integers, i.e. TreeNode(1, 2, 3) vs TreeNode(1, TreeNode(2), TreeNode(3))
    public required convenience init(integerLiteral value: Int) {
        self.init(value)
    }

    // ExpressibleByArrayLiteral
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

    // Equatable
    // This is to allow XCTAssertEqual to compare two TreeNodes
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


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(log(n))

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.minDepth([3, 9, 20, nil, nil, 15, 7]), 2)
        XCTAssertEqual(s2.minDepth([3, 9, 20, nil, nil, 15, 7]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.minDepth([2, nil, 3, nil, 4, nil, 5, nil, 6]), 5)
        XCTAssertEqual(s2.minDepth([2, nil, 3, nil, 4, nil, 5, nil, 6]), 5)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.minDepth([2]), 1)
        XCTAssertEqual(s2.minDepth([2]), 1)
        XCTAssertEqual(s1.minDepth(nil), 0)
        XCTAssertEqual(s2.minDepth(nil), 0)
    }
}

Tests.defaultTestSuite.run()
