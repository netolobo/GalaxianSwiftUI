//
//  EnemyView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import SwiftUI

struct EnemyView: View {
    let enemy: Enemy
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(enemy.color)
            .frame(width: enemy.size, height: enemy.size)
            .position(enemy.position)
    }
}

#Preview {
    EnemyView(enemy: Enemy.example)
}