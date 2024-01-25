//
//  EnemyModel.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import Foundation
import SwiftUI

struct Enemy : Identifiable {
    let id = UUID()
    var color: Color
    let velocity: Double
    let size: Double = 25.0
    var position : CGPoint
}


extension Enemy {
    static let example = Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 0, y: 0))
                               
    static let backEnemies = [Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 20, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 60, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 100, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 140, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 180, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 220, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 260, y: 100)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 300, y: 100))]
    
    static let middleEnemies = [Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0))]
    
    static let frontEnemies = [Enemy(color: .yellow, velocity: 0.1, position: CGPoint(x: 0, y: 0)),
                               Enemy(color: .yellow, velocity: 0.1, position: CGPoint(x: 0, y: 0))]
    
    static let all = [backEnemies, middleEnemies, frontEnemies]
}
