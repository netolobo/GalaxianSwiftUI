//
//  EnemyView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import SwiftUI

struct AsteroidView: View {
    let asteroid: Asteroid
    
    var body: some View {
        Image(asteroid.imageName)
            .resizable()
            .frame(width: asteroid.size.width, height: asteroid.size.height)
            .position(asteroid.position)
    }
}

#Preview {
    AsteroidView(asteroid: Asteroid.example)
}
