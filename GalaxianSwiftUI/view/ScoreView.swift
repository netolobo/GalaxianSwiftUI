//
//  ScoreView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 30/01/24.
//

import SwiftUI

struct ScoreView: View {
    @Binding var viewModel : GameViewModel
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            Text(Const.scoreLabel)
                .font(.title3)
                .fontWeight(.regular)
                .fontDesign(.serif)
                .foregroundStyle(.white)
            
            Text("\(viewModel.scoreCounter)")
                .font(.title)
                .fontWeight(.heavy)
                .fontDesign(.serif)
                .foregroundStyle(.white)
        }
        .position(x: geo.size.width / 2, y: viewModel.gameState == .over ? geo.size.height / 2 - 110 : 30)
    }
}

#Preview {
    GeometryReader { geo in
        ScoreView(viewModel: .constant(GameViewModel()), geo: geo)

    }
}
