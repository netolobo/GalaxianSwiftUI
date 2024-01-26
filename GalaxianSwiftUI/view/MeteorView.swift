//
//  EnemyView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import SwiftUI

struct MeteorView: View {
    let enemy: Meteor
    
    var body: some View {
        Image(enemy.imageName)
            .resizable()
            .frame(width: enemy.size.width, height: enemy.size.height)
            .position(enemy.position)
    }
}

#Preview {
    MeteorView(enemy: Meteor.example)
}
