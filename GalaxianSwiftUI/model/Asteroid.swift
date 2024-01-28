//
//  EnemyModel.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import Foundation
import SwiftUI

struct Asteroid : Identifiable {
    let id = UUID()
    var imageName: String
    let velocity: Double
    let size = CGSize(width: 25, height: 25)
    var position : CGPoint
}

extension Asteroid {
    
    
    static let example = Asteroid(imageName: Const.asteroidImageName, velocity: 0.5, position: CGPoint(x: 500, y: 500))
                               

    static var back = AsteroidsGenerator.generate(quantity: 12, horizontalPadding: 30, initialXPosition: 20, positionY: Const.backAsteroidsPositionY, velocity: Const.backAsteroidsVelocity)
    
    
    static let middle = AsteroidsGenerator.generate(quantity: 8, horizontalPadding: 30, initialXPosition: 80, positionY: Const.middleAsteroidsPositionY, velocity: Const.middleAsteroidsVelocity)
    
    static let front = AsteroidsGenerator.generate(quantity: 4, horizontalPadding: 30, initialXPosition: 140, positionY: Const.frontAsteroidsPositionY, velocity: Const.frontAsteroidsVelocity)
    
}
