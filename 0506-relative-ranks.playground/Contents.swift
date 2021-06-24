import Foundation

// 506. Relative Ranks
// https://leetcode.com/problems/relative-ranks

// MARK: - Solution
// ================
class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        guard !score.isEmpty else { return [] }

        let sortedScore = score.sorted(by: >)
        var output = [String]()
        var mapScoreToRank = [Int: String]()

        for (i, score) in sortedScore.enumerated() {
            switch i {
            case 0:
                mapScoreToRank[score] = "Gold Medal"
            case 1:
                mapScoreToRank[score] = "Silver Medal"
            case 2:
                mapScoreToRank[score] = "Bronze Medal"
            default:
                mapScoreToRank[score] = "\(i + 1)"
            }
        }

        for rank in score {
            output.append(mapScoreToRank[rank, default: ""])
        }

        return output
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlogn)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findRelativeRanks([5, 4, 3, 2, 1]), ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findRelativeRanks([10, 3, 8, 9, 4]), ["Gold Medal", "5", "Bronze Medal", "Silver Medal", "4"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findRelativeRanks([1, 2]), ["Silver Medal", "Gold Medal"])
    }
}

Tests.defaultTestSuite.run()
