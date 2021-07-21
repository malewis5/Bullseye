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
        100 - abs(targetValue - sliderValue)
    }
}
