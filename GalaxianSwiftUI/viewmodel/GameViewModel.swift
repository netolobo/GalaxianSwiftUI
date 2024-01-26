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
    var meteorMovementDirection = MeteorHorizontalMovement.right
    var backMeteors = Meteor.back
    var randomMeteor = Meteor.back[0]
    var geo: GeometryProxy?
    var gameState = GameState.initial

    
    private func isCollision(index: Int) -> Bool {
        let ramdomMeteor = CGRect(origin: backMeteors[index].position, size: backMeteors[index].size)
        let ship = CGRect(origin: ship.position, size: ship.size)
        return ramdomMeteor.intersects(ship)
    }
    
    func resetGame() {
        setShipInitialPosition()
        meteorMovementDirection = MeteorHorizontalMovement.right
        backMeteors = Meteor.back
        randomMeteor = Meteor.back.first!
        score = 0
        gameState = .initial
    }
    
    private func meteorLeftRighMovement() {
        guard let geo = self.geo else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            if self.gameState == .playing {
                if self.meteorMovementDirection == .right {
                    for i in 0..<self.backMeteors.count {
                        self.backMeteors[i].position.x += 1
                    }
                } else {
                    for i in 0..<self.backMeteors.count {
                        self.backMeteors[i].position.x -= 1
                    }
                }
                
                if self.backMeteors[7].position.x >= geo.size.width - 12.5 {
                    self.meteorMovementDirection = .left
                }
                
                if self.backMeteors[0].position.x <= 12.5 {
                    self.meteorMovementDirection = .right
                }
            }
        }
    }
    
    private func meteorTopBottomMovement() {
        guard let geo = self.geo else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
              if self.gameState == .playing {
                if let index = self.backMeteors.firstIndex(where: { $0.id == self.randomMeteor.id }) {
                    if self.backMeteors[index].position.y < geo.size.height {
                        self.backMeteors[index].position.y += 1
                        if self.isCollision(index: index) {
                            self.gameState = .over
                        }
                    } else {
                        withAnimation(.bouncy) {
                            self.score += 1
                        }
                        self.backMeteors[index].position.y = 0 //reset enemy position
                        
                        withAnimation(.bouncy(duration: 1.3)) {
                            self.backMeteors[index].position.y = self.randomMeteor.position.y
                        }
                        
                        self.randomMeteor = self.backMeteors.randomElement()! //update the random enemy
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
        randomMeteor = backMeteors.randomElement()!
        setShipInitialPosition()
        meteorsMovement()
    }
    
    private func setShipInitialPosition() {
        guard let geo = self.geo else { return }
        ship.position = CGPoint(x: geo.size.width / 2, y: geo.size.height - 40)
    }
    
}
