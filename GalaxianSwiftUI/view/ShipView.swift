//
//  ShipView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 25/01/24.
//

import SwiftUI

struct ShipView: View {
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        
        Image(viewModel.ship.imageName)
            .resizable()
            .frame(width: 50, height: 50)
            .position(viewModel.ship.position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if viewModel.gameState != .over {
                            viewModel.gameState = .playing
                        }
                        
                        if viewModel.gameState != .over && value.location.x > 25 && value.location.x < viewModel.geo!.size.width - 25 {
                            withAnimation {
                                viewModel.ship.position = CGPoint(x: value.location.x, y: viewModel.ship.position.y)
                            }
                        }
                    }
                    .onEnded({ _ in
                        if viewModel.gameState != .over { viewModel.gameState = .paused }
                    })
            )
    }
}

#Preview {
    ShipView( viewModel: .constant(GameViewModel()))
}
