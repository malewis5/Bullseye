//
//  Game.swift
//  Bullseye
//
//  Created by Matthew Lewis on 7/20/21.
//

import Foundation

struct Game {
    var targetValue = Int.random(in: 1...100)
    var totalScore = 0
    var currentRound = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    var livesRemaining = 3
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            for test in (1...60) {
                addLeaderBoardEntry(points: test * 1000)
            }
        }
    }
    
    func calculatePoints(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - targetValue)
        let bonus: Int
        
        if (difference == 0) {
            bonus = 100
        }
        else if (difference <= 2) {
            bonus = 50
        }
        else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func removeLife(points: Int) {
        if (points < 95) {
            livesRemaining -= 1
        }
    }
    
    
    
    mutating func startNewRound(points: Int) {
        removeLife(points: points)
        totalScore += points
        currentRound += 1
        targetValue = Int.random(in: 1...100)
        if livesRemaining < 0 {
            loseGame(totalScore: totalScore)
        }
    }
    
    mutating func restartGame() {
        totalScore = 0
        currentRound = 1
        livesRemaining = 3
        targetValue = Int.random(in: 1...100)
    }
    
    mutating func loseGame(totalScore: Int) {
        addLeaderBoardEntry(points: totalScore)
        restartGame()
    }
    
    mutating func addLeaderBoardEntry(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
        
    }
    
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
