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
    
    func playGame(rounds: Int, scorePerRound: Int) -> Game {
        var testGame = Game()
        for _ in (1...rounds) {
            testGame.startNewRound(points: scorePerRound)
        }
        return testGame
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
        var game = playGame(rounds: 4, scorePerRound: 50)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 50 * 4)
        game.startNewRound(points: 75)
        game.startNewRound(points: 75)
        game.startNewRound(points: 75)
        game.startNewRound(points: 75)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].score, 75*4)
        XCTAssertEqual(game.leaderboardEntries[1].score, 50*4)
    }
    
    func testLoseGame() {
        let testGame = playGame(rounds: 4, scorePerRound: 94)
        let livesRemaining = testGame.livesRemaining
        let count = testGame.leaderboardEntries.count
        let score = testGame.leaderboardEntries[0].score
        XCTAssertEqual(livesRemaining, 3)
        XCTAssertEqual(count, 1)
        XCTAssertEqual(score, 94 * 4)
    }
    
}
