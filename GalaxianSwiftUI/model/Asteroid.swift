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
    let size = Const.asteroidSize
    var position : CGPoint
}

extension Asteroid {
    static let example = Asteroid(
        imageName: Const.asteroidImageName,
        velocity: Const.asteroidVelocity,
        position: CGPoint(x: 500, y: 500)
    )
    
    static var asteroids = AsteroidsGenerator.generate(
        quantity: Const.asteroidQuantity,
        horizontalPadding: Const.asteroidHorizontalPadding,
        initialPositionX: Const.asteroidInitialPositionX,
        positionY: Const.asteroidPositionY,
        velocity: Const.asteroidVelocity
    )
}
