//
//  Gameself.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 23/01/24.
//

import Foundation
import SwiftUI

@Observable
class GameViewModel {
    var score = 0
    var ship = Ship()
    var asteroidMovementDirection = AsteroidHorizontalMovement.right
    var backAsteroids = Asteroid.back
    var randomAsteroid = Asteroid.back[0]
    var geo: GeometryProxy?
    var gameState = GameState.initial

    
    private func isCollision(asteroid: Asteroid) -> Bool {
        let ramdomAsteroid = CGRect(origin: asteroid.position, size: asteroid.size)
        let ship = CGRect(origin: ship.position, size: ship.size)
        return ramdomAsteroid.intersects(ship)
    }
    
    func resetGame() {
        setShipInitialPosition()
        asteroidMovementDirection = AsteroidHorizontalMovement.right
        backAsteroids = Asteroid.back
        randomAsteroid = Asteroid.back.first!
        score = 0
        gameState = .initial
    }
    
    private func meteorLeftRighMovement() {
        guard let geo = self.geo else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            if self.gameState == .playing {
                if self.asteroidMovementDirection == .right {
                    for i in 0..<self.backAsteroids.count {
                        self.backAsteroids[i].position.x += 1
                    }
                } else {
                    for i in 0..<self.backAsteroids.count {
                        self.backAsteroids[i].position.x -= 1
                    }
                }
                
                if self.backAsteroids[7].position.x >= geo.size.width - 12.5 {
                    self.asteroidMovementDirection = .left
                }
                
                if self.backAsteroids[0].position.x <= 12.5 {
                    self.asteroidMovementDirection = .right
                }
            }
        }
    }
    
    private func meteorTopBottomMovement() {
        guard let geo = self.geo else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
              if self.gameState == .playing {
                if let index = self.backAsteroids.firstIndex(where: { $0.id == self.randomAsteroid.id }) {
                    if self.backAsteroids[index].position.y < geo.size.height {
                        self.backAsteroids[index].position.y += 1
                        if self.isCollision(asteroid: self.backAsteroids[index]) {
                            self.gameState = .over
                        }
                    } else {
                        withAnimation(.bouncy) {
                            self.score += 1
                        }
                        self.backAsteroids[index].position.y = 0 //reset enemy position
                        
                        withAnimation(.bouncy(duration: 1.3)) {
                            self.backAsteroids[index].position.y = self.randomAsteroid.position.y
                        }
                        
                        self.randomAsteroid = self.backAsteroids.randomElement()! //update the random enemy
                    }
                }
            }
        }
    }
    
    private func meteorsMovement() {
        meteorLeftRighMovement()
        meteorTopBottomMovement()
    }
    
    func setupGame(geo: GeometryProxy) {
        self.geo = geo
        randomAsteroid = backAsteroids.randomElement()!
        setShipInitialPosition()
        meteorsMovement()
    }
    
    private func setShipInitialPosition() {
        guard let geo = self.geo else { return }
        ship.position = CGPoint(x: geo.size.width / 2, y: geo.size.height - 40)
    }
    
}
