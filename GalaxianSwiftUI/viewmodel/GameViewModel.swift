//
//  GameViewModel.swift
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
    var enemiesPositionX = 120.0
    var enemiesMovement = EnemiesMovement.right
    var backEnemies = Enemy.backEnemies
    var randomEnemy = Enemy.backEnemies.first!
    var lastEnemyRemoved = Enemy.backEnemies.first!
    var gameOver = false
    
    func isCollision(index: Int) -> Bool {
        let ramdomEnemy = CGRect(origin: backEnemies[index].position, size: CGSize(width: 50, height: 50))
        let ship = CGRect(origin: shipPosition, size: CGSize(width: 50, height: 50))
  
        return ramdomEnemy.intersects(ship)
    }
    
    func ramdomAnimation(duration: TimeInterval) -> Animation {
        let animations = [
            Animation.easeInOut(duration: duration),
            Animation.easeIn(duration: duration),
            Animation.easeOut(duration: duration),
            Animation.linear(duration: duration),
            Animation.bouncy(duration: duration),
            Animation.spring(duration: duration)
        ]
        return animations.randomElement()!
    }
    
    func resetGame() {
        shipPosition = CGPoint(x: 200, y: 500)
        enemiesPositionX = 120.0
        enemiesMovement = EnemiesMovement.right
        backEnemies = Enemy.backEnemies
        randomEnemy = Enemy.backEnemies.first!
        lastEnemyRemoved = Enemy.backEnemies.first!
        score = 0
    }
    
}
