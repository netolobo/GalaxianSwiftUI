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
    static let example = Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 0, y: 0))
                               
    static let back = [Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 20, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 60, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 100, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 140, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 180, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 220, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 260, y: 100)),
                              Asteroid(imageName: "meteor", velocity: 0.5, position: CGPoint(x: 300, y: 100))]
    
    static let middle = [Asteroid(imageName: "meteor", velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Asteroid(imageName: "meteor", velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Asteroid(imageName: "meteor", velocity: 0.3, position: CGPoint(x: 0, y: 0)),
                                Asteroid(imageName: "meteor", velocity: 0.3, position: CGPoint(x: 0, y: 0))]
    
    static let front = [Asteroid(imageName: "meteor", velocity: 0.1, position: CGPoint(x: 0, y: 0)),
                               Asteroid(imageName: "meteor", velocity: 0.1, position: CGPoint(x: 0, y: 0))]
    
}
