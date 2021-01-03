import Foundation

// 804. Unique Morse Code Words
// https://leetcode.com/problems/unique-morse-code-words

// MARK: - Solution
// ================
class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        guard !words.isEmpty else { return 0 }
        
        let morseCodes = [".-","-...","-.-.","-..",".",
                          "..-.","--.","....","..",".---",
                          "-.-",".-..","--","-.","---",
                          ".--.","--.-",".-.","...","-",
                          "..-","...-",".--","-..-","-.--","--.."]
        
        // build dictionary of characters and morse code
        var chartoMorseCodes = [Character: String]()
        for (index, char) in "abcdefghijklmnopqrstuvwxyz".enumerated() {
            chartoMorseCodes[char] = morseCodes[index]
        }
        
        var result = Set<String>()
        for word in words {
            var str = ""
            for c in word {
                if let code = chartoMorseCodes[c] {
                    str.append(code)
                }
            }
            result.insert(str)
        }
        
        return result.count
    }
    
    
    // With ascii value
    func uniqueMorseRepresentations_withAsciiValue(_ words: [String]) -> Int {
        guard !words.isEmpty else { return 0}
        let morseCode = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        
        let a = Character("a").asciiValue!  // lowercase a ascii value
        
        var morseWords: Set<String> = Set()
        
        for word in words {
            var str = ""
            
            for char in word {
                guard let ascii = char.asciiValue else { continue }
                let index = Int(ascii - a) // get index of morse code location in array
                str.append(morseCode[index])
            }
            
            morseWords.insert(str)
        }
        
        return morseWords.count
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.uniqueMorseRepresentations(["gin", "zen", "gig", "msg"]), 2)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.uniqueMorseRepresentations([]), 0)
    }
    
    func testLeetCodeExample1() {
        XCTAssertEqual(s.uniqueMorseRepresentations_withAsciiValue(["gin", "zen", "gig", "msg"]), 2)
    }
    
    // Additional Examples
    func testAdditionalExample2() {
        XCTAssertEqual(s.uniqueMorseRepresentations_withAsciiValue([]), 0)
    }
}

Tests.defaultTestSuite.run()

