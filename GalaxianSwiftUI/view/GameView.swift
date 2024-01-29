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
                    Text(Const.scoreLabel)
                        .position(x: geo.size.width / 2, y: viewModel.gameState == .over ? geo.size.height / 2 - 120 : 0)
                        .font(.title3)
                        .fontWeight(.regular)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                    
                    Text("\(viewModel.score)")
                        .position(x: geo.size.width / 2, y: viewModel.gameState == .over ? geo.size.height / 2 - 90 : 30)
                        .font(.title)
                        .fontWeight(.heavy)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                    
                    ForEach(viewModel.backAsteroids) { enemy in
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
                    OverView(viewModel: $viewModel)
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
