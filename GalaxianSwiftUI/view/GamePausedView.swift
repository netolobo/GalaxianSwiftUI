//
//  StartScreenView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 25/01/24.
//

import SwiftUI

struct GamePausedView: View {
    @State private var animatePauseMessage = false
    @State private var animateGameName = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            Text(Const.gameTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .fontDesign(.serif)
                .foregroundStyle(Gradient(colors: [.gray, .brown, .pink]))
                .shadow(color: .white, radius: 1)
                .shadow(color: .white, radius: 1)
                .shadow(color: .purple, radius: 1)
                .scaleEffect(animateGameName ? 1 : 0.5)
                .opacity(animateGameName ? 1 : 0.5)
            
            Text(Const.gamePausedMessage)
                .foregroundStyle(.white)
                .font(.headline)
                .fontWeight(.bold)
                .opacity(animatePauseMessage ? 0.0 : 1.0)
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.3)) {
                animateGameName = true
            }
            withAnimation(.linear(duration: 1.3).delay(1).repeatForever()) {
                animatePauseMessage = true
            }
        }
    }
}

#Preview {
    GamePausedView()
}
