import Foundation

// 1022. Sum of Root To Leaf Binary Numbers
// https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers

// MARK: - Solution
// ================
class Solution1 {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        return sumRootToLeaf(root, 0)
    }

    func sumRootToLeaf(_ root: TreeNode?, _ n: Int) -> Int {
        guard let root = root else { return 0 }
        var sum = n
        sum = sum << 1 + root.val
        if root.left == nil, root.right == nil {
            return sum
        }
        return sumRootToLeaf(root.left, sum) + sumRootToLeaf(root.right, sum)
    }
}

class Solution2 {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack: [(node: TreeNode, val: Int)] = [(root, 0)]
        var sum = 0

        while !stack.isEmpty {
            let (node, val) = stack.removeLast()
            let value = val << 1 + node.val

            if node.left == nil, node.right == nil { // leaf
                sum += value
            } else {
                if let right = node.right {
                    stack.append((right, value))
                }
                if let left = node.left {
                    stack.append((left, value))
                }
            }
        }

        return sum
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
// Space Complexity: O(h) // height of tree


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.sumRootToLeaf([1, 0, 1, 0, 1, 0, 1]), 22)
        XCTAssertEqual(s2.sumRootToLeaf([1, 0, 1, 0, 1, 0, 1]), 22)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.sumRootToLeaf([0]), 0)
        XCTAssertEqual(s2.sumRootToLeaf([0]), 0)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.sumRootToLeaf([1]), 1)
        XCTAssertEqual(s2.sumRootToLeaf([1]), 1)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s1.sumRootToLeaf([1, 1]), 3)
        XCTAssertEqual(s2.sumRootToLeaf([1, 1]), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.sumRootToLeaf(nil), 0)
        XCTAssertEqual(s2.sumRootToLeaf(nil), 0)
    }
}

Tests.defaultTestSuite.run()
