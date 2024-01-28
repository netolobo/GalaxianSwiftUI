//
//  AsteroidsGenerator.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 28/01/24.
//

import Foundation

struct AsteroidsGenerator {
    static func generate(quantity: Int,horizontalPadding: Int, initialXPosition: Int, positionY: Int, velocity: Double) -> [Asteroid] {
        var asteroids = [Asteroid]()
        var xPosition = initialXPosition
        for _ in 0..<quantity {
            asteroids.append(
                Asteroid(
                    imageName: Const.asteroidImageName,
                    velocity: velocity,
                    position: CGPoint(x: xPosition, y: positionY)
                )
            )
            xPosition += horizontalPadding
        }
        return asteroids
    }
}
