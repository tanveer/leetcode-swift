import Foundation

// 950. Reveal Cards In Increasing Order
// https://leetcode.com/problems/reveal-cards-in-increasing-order

// MARK: - Solution
// ================
class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        guard !deck.isEmpty else { return [] }
        
        var sortedDeck = deck.sorted()
        var cards = [Int]()
        
        while !sortedDeck.isEmpty {
            if let card = cards.last {
                cards.popLast()
                cards.insert(card, at: 0)
            }
            
            if let revealed = sortedDeck.popLast() {
                cards.insert(revealed, at: 0)
            }
            
        }
        
        return cards
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n log n) because of sorting
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.deckRevealedIncreasing([17, 13, 11, 2, 3, 5, 7]), [2, 13, 3, 11, 5, 17, 7])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.deckRevealedIncreasing([]), [])
    }
}

Tests.defaultTestSuite.run()
