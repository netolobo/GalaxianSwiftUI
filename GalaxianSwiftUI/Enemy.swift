//
//  EnemyModel.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import Foundation
import SwiftUI

struct Enemy {
    let id = UUID()
    var color: Color
    let velocity: Double
    let size: Double = 25.0
    var position : CGPoint
}

extension Enemy {
    static let backEnemies = [Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 0, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 5, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 15, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 20, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 25, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 30, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 35, y: 0)),
                              Enemy(color: .red, velocity: 0.5, position: CGPoint(x: 40, y: 0))]
    
    static let middleEnemies = [Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Enemy(color: .orange, velocity: 0.3, position: CGPoint(x: 0, y: 0))]
    
    static let frontEnemies = [Enemy(color: .yellow, velocity: 0.1, position: CGPoint(x: 0, y: 0)),
                               Enemy(color: .yellow, velocity: 0.1, position: CGPoint(x: 0, y: 0))]
    
    static let all = [backEnemies, middleEnemies, frontEnemies]
}
