//
//  Const.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 27/01/24.
//

import Foundation

struct Const {
    //Asteroid
    static let asteroidImageName = "asteroid"
    static let asteroidVelocity = 0.0007
    static let asteroidPositionY = 100
    static let asteroidQuantity = 12
    static let asteroidHorizontalPadding = 30
    static let asteroidInitialPositionX = 20
    static let asteroidSize = CGSize(width: 25, height: 25)
    
    //Ship
    static let shipImageName = "ship"
    static let shipSize = CGSize(width: 50, height: 50)
    static var shipPosition = CGPoint(x: 200, y: 500)
    
    //Space
    static let spaceImageName = "space"
    
    static let gameTitle = "ASTEROIDS RAIN"
    static let initialMessage = "Hold the space ship to play"
    
    static let gamePausedMessage = "Game paused, hold the space ship to resume"
    
    static let gameOverMessage = "GAME OVER"
    static let playAgainLabel = "Play again!"
    
    static let scoreLabel = "SCORE"
}
