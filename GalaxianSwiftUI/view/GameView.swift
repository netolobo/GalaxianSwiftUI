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
                    Text("Score \(viewModel.score)")
                        .position(x: geo.size.width / 2, y: 10)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                    
                    ForEach(viewModel.backAsteroids) { enemy in
                        AsteroidView(asteroid: enemy)
                    }
                    
                    ForEach(viewModel.middleAsteroids) { enemy in
                        AsteroidView(asteroid: enemy)
                    }
                    
                    ForEach(viewModel.frontAsteroids) { enemy in
                        AsteroidView(asteroid: enemy)
                    }
                    
                }

                ShipView(viewModel: $viewModel)
                
                switch viewModel.gameState {
                case .initial:
                    InitialView()
                case .paused:
                    PauseView()
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
