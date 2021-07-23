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
    
    
    
    mutating func startNewRound(points: Int) {
        totalScore += points
        currentRound += 1
        targetValue = Int.random(in: 1...100)
    }
    
    mutating func restartGame() {
        totalScore = 0
        currentRound = 1
        targetValue = Int.random(in: 1...100)
    }
}
