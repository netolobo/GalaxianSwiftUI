//
//  SpaceView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 26/01/24.
//

import SwiftUI

struct SpaceView: View {
    @State private var offsetY: CGFloat = 0.0
    let backgroundImage = Image("space")
    @Binding var gameState : GameState
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backgroundImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: offsetY)
                    .clipped()
                
                backgroundImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: offsetY - geometry.size.height)
                    .clipped()
            }
            .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                        if gameState != .paused && gameState != .over {
                        withAnimation(.linear(duration: 0.05)) {
                            offsetY += 1
                            if offsetY >= geometry.size.height {
                                offsetY = 0
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SpaceView(gameState: .constant(.initial))
}
