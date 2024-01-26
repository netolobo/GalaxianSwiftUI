//
//  ShipView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 25/01/24.
//

import SwiftUI

struct ShipView: View {
//    @Binding var shipPosition: CGPoint
//    @Binding var gameState : GameState
//    let geo: GeometryProxy
    @Binding var viewModel: GameViewModel
    
    var body: some View {
        Image(systemName: "arrow.up.square")
            .frame(width: 50, height: 50)
            .font(.system(size: 50))
            .foregroundStyle(.white)
            .position(viewModel.shipPosition)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                        if viewModel.gameState != .over {
                            viewModel.gameState = .playing
                        }
                        
                        
                        if viewModel.gameState != .over && value.location.x > 25 && value.location.x < viewModel.geo!.size.width - 25 {
                            withAnimation {
                                viewModel.shipPosition = CGPoint(x: value.location.x, y: viewModel.shipPosition.y)
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
    GeometryReader { geo in
        ShipView(
//            shipPosition: .constant(
//                CGPoint(
//                    x: geo.size.width / 2,
//                    y: geo.size.height / 2)
//            ),
//            gameState: .constant(.playing),
//            geo: geo
            viewModel: .constant(GameViewModel())
        )
    }
    
}
