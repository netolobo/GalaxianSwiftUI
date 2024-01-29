//
//  GameOverScreen.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 26/01/24.
//

import SwiftUI

struct GameOverView: View {
    @State private var animateGameName = false
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 40) {
            
            Text(Const.gameOverMessage)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .fontDesign(.serif)
                .foregroundStyle(Gradient(colors: [.red, .red, .red]))
                .shadow(color: .white, radius: 1)
                .shadow(color: .white, radius: 1)
                .shadow(color: .purple, radius: 1)
                .scaleEffect(animateGameName ? 1 : 0.5)
                .opacity(animateGameName ? 1 : 0.5)
            
                Button {
                    viewModel.resetGame()
                } label: {
                    Text(Const.playAgainLabel)
                        .padding()
                        .background(Gradient(colors: [.gray, .brown, .red]))
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                        .clipShape(.capsule)
                        .scaleEffect(animateGameName ? 1 : 0.5)
                        .opacity(animateGameName ? 1 : 0.5)
                }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.3)) {
                animateGameName = true
            }
        }
    }
}

#Preview {
    GameOverView(viewModel: .constant(GameViewModel()))
}
