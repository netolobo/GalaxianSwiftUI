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
    var shipPosition = CGPoint(x: 200, y: 500)
    var enemiesMovementDirection = EnemiesMovement.right
    var backEnemies = Enemy.backEnemies
    var randomEnemy = Enemy.backEnemies[0]
    var geo: GeometryProxy?
    var showGameOverDialg = false
    var gameState = GameState.initial {
        didSet {
            showGameOverDialg = gameState == .over
        }
    }
    
    func isCollision(index: Int) -> Bool {
        let ramdomEnemy = CGRect(origin: backEnemies[index].position, size: CGSize(width: 50, height: 50))
        let ship = CGRect(origin: shipPosition, size: CGSize(width: 50, height: 50))
  
        return ramdomEnemy.intersects(ship)
    }
    
    func resetGame() {
        setShipInitialPosition()
        enemiesMovementDirection = EnemiesMovement.right
        backEnemies = Enemy.backEnemies
        randomEnemy = Enemy.backEnemies.first!
        score = 0
        gameState = .initial
    }
    
    private func enemiesLeftRighMovement() {
        guard let geo = self.geo else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            if self.gameState == .playing {
                if self.enemiesMovementDirection == .right {
                    for i in 0..<self.backEnemies.count {
                        self.backEnemies[i].position.x += 1
                    }
                } else {
                    for i in 0..<self.backEnemies.count {
                        self.backEnemies[i].position.x -= 1
                    }
                }
                
                if self.backEnemies[7].position.x >= geo.size.width - 12.5 {
                    self.enemiesMovementDirection = .left
                }
                
                if self.backEnemies[0].position.x <= 12.5 {
                    self.enemiesMovementDirection = .right
                }
            }
        }
    }
    
    private func enemiesTopBottomMovement() {
        guard let geo = self.geo else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
              if self.gameState == .playing {
                if let index = self.backEnemies.firstIndex(where: { $0.id == self.randomEnemy.id }) {
                    if self.backEnemies[index].position.y < geo.size.height {
                        self.backEnemies[index].position.y += 1
                        if self.isCollision(index: index) {
                            self.gameState = .over
                        }
                    } else {
                        withAnimation(.bouncy) {
                            self.score += 1
                        }
                        self.backEnemies[index].position.y = 0 //reset enemy position
                        
                        withAnimation(.bouncy(duration: 1.3)) {
                            self.backEnemies[index].position.y = self.randomEnemy.position.y
                        }
                        
                        self.randomEnemy = self.backEnemies.randomElement()! //update the random enemy
                    }
                }
            }
        }
    }
    
    private func enemiesMovement() {
        enemiesLeftRighMovement()
        enemiesTopBottomMovement()
    }
    
    func setupGame(geo: GeometryProxy) {
        self.geo = geo
        randomEnemy = backEnemies.randomElement()!
        setShipInitialPosition()
        enemiesMovement()
    }
    
    private func setShipInitialPosition() {
        guard let geo = self.geo else { return }
        shipPosition = CGPoint(x: geo.size.width / 2, y: geo.size.height - 40)
    }
    
}
