import Foundation

// 208. Implement Trie (Prefix Tree)
// https://leetcode.com/problems/implement-trie-prefix-tree

// MARK: - Solution
// ================
class Node {
    let char: Character
    var isWord: Bool
    var children: [Node?]

    init(char: Character) {
        self.char = char
        isWord = false
        children = Array(repeating: nil, count: 26)
    }
}

class Trie {
    private var root: Node

    init() {
        root = Node(char: "0")
    }

    func insert(_ word: String) {
        var currentNode:Node? = root
        for char in word {
            if currentNode?.children[indexOf(char)] == nil {
                currentNode?.children[indexOf(char)] = Node(char: char)
            }
            currentNode = currentNode?.children[indexOf(char)]
        }
        currentNode?.isWord = true
    }

    private func getNode(_ word: String) -> Node? {
        var currentNode: Node? = root
        for char in word {
            if currentNode?.children[indexOf(char)] == nil { return nil }
            currentNode = currentNode?.children[indexOf(char)]
        }

        return currentNode
    }

    func search(_ word: String) -> Bool {
        guard let node = getNode(word) else { return false }
        return node.isWord
    }

    func  startsWith(_ prefix: String) -> Bool {
        return getNode(prefix) != nil
    }

    private func indexOf(_ c: Character) -> Int {
        return Int(c.asciiValue! - Character("a").asciiValue!)
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let trie = Trie()
        trie.insert("apple")
        XCTAssertTrue(trie.search("apple"))
        XCTAssertFalse(trie.search("app"))
        XCTAssertTrue(trie.startsWith("app"))
        trie.insert("app")
        XCTAssertTrue(trie.search("app"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        let trie = Trie()
        trie.insert("bat")
        XCTAssertTrue(trie.search("bat"))
        XCTAssertFalse(trie.search("battle"))
        XCTAssertTrue(trie.startsWith("ba"))
        trie.insert("battle")
        XCTAssertTrue(trie.search("battle"))
    }
}

Tests.defaultTestSuite.run()
