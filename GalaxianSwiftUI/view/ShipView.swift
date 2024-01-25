//
//  ShipView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 25/01/24.
//

import SwiftUI

struct ShipView: View {
    @Binding var shipPosition: CGPoint
    let geo: GeometryProxy
    var body: some View {
        Image(systemName: "arrow.up.square")
            .frame(width: 50, height: 50)
            .font(.system(size: 50))
            .foregroundStyle(.white)
            .position(shipPosition)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.location.x > 25 && value.location.x < geo.size.width - 25 {
                            withAnimation {
                                shipPosition = CGPoint(x: value.location.x, y: shipPosition.y)
                            }
                        }
                    }
            )
    }
}

#Preview {
    GeometryReader { geo in
        ShipView(shipPosition: .constant(CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)), geo: geo)
    }
    
}
