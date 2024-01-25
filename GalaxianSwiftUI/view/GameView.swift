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
                
                Text("Score \(viewModel.score)")
                    .position(x: geo.size.width / 2, y: 10)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .foregroundStyle(.white)
                
                ForEach(viewModel.backEnemies) { enemy in
                    EnemyView(enemy: enemy)
                }
                
//                BulletView(shipPositionX: $viewModel.shipPosition.x)

                ShipView(shipPosition: $viewModel.shipPosition, geo: geo)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .onAppear { viewModel.setupGame(geo: geo) }
            .alert("Game Over", isPresented: $viewModel.gameOver) {
                Button {
                    viewModel.resetGame(geo: geo)
                } label: {
                    Text("Play again!")
                }
            }
        }
    }
}

#Preview {
    GameView()
}
