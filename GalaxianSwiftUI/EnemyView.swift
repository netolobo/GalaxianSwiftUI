//
//  EnemyView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import SwiftUI

struct EnemyView: View {
    let color: Color
    let size: Double
    let position: CGPoint
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .frame(width: size, height: size)
            .position(position)
    }
}

#Preview {
    EnemyView(color: Color.pink, size: 35, position: CGPoint(x: 10.0, y: 10.0))
}
