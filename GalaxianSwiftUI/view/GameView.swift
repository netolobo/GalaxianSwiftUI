//
//  ContentView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 20/01/24.
//

import SwiftUI

struct GameView: View {
    @State private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader() { geo in
            
            ZStack {
                
                if viewModel.gameState != .initial {
                    
                    ScoreView(viewModel: $viewModel, geo: geo)
                    
                    ForEach(viewModel.backAsteroids) { asteroid in
                        AsteroidView(asteroid: asteroid)
                    }
                }

                ShipView(viewModel: $viewModel)
                
                switch viewModel.gameState {
                case .initial:
                    GameInitialView()
                case .paused:
                    GamePausedView()
                case .over:
                    GameOverView(viewModel: $viewModel)
                case .playing:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(SpaceView(gameState: $viewModel.gameState))
            .onAppear { viewModel.setupGame(geo: geo) }
        }
    }
}

#Preview {
    GameView()
}
