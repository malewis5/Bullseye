//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Matthew Lewis on 7/20/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testScorePositive() {
        let guess = game.targetValue + 5
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.targetValue - 5
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.totalScore, 100)
        XCTAssertEqual(game.currentRound, 2)
    }
    
    func testScoreExact() {
        let guess = game.targetValue
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess = game.targetValue - 2
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 148)
    }
    
    func testRestartGame() {
        game.startNewRound(points: 94)
        XCTAssertNotEqual(game.totalScore, 0)
        XCTAssertNotEqual(game.currentRound, 1)
        XCTAssertNotEqual(game.livesRemaining, 3)
        game.restartGame()
        XCTAssertEqual(game.totalScore, 0)
        XCTAssertEqual(game.currentRound, 1)
        XCTAssertEqual(game.livesRemaining, 3)
    }
    
    func testLiveLost() {
        let guess = game.targetValue + 6
        let livesStart = game.livesRemaining
        let score = game.calculatePoints(sliderValue: guess)
        game.startNewRound(points: score)
        let livesRemaining = game.livesRemaining
        XCTAssertEqual(livesRemaining, livesStart - 1)
    }
    
    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries[0].score, 200)
        XCTAssertEqual(game.leaderboardEntries[1].score, 100)
    }
    
    
}
