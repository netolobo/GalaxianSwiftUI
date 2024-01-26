//
//  InitialScreen.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 26/01/24.
//

import SwiftUI

struct InitialView: View {
    @State private var animateInitialMessage = false
    @State private var animateGameTitle = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                    Text("ASTEROIDS RAIN")
                    .frame(height: 100)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .fontDesign(.serif)
                        .foregroundStyle(Gradient(colors: [.gray, .brown, .pink]))
                        .shadow(color: .white, radius: 1)
                        .shadow(color: .white, radius: 1)
                        .shadow(color: .purple, radius: 1)
                        .position(x: geo.size.width / 2, y: animateGameTitle ? geo.size.height / 2 : -10 )
                
                Text("Hold the space ship to play")
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                    .opacity(animateInitialMessage ? 0.0 : 1.0)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2 + 100)
            }
            .onAppear {
                withAnimation(.bouncy(duration: 0.9)) {
                    animateGameTitle = true
                }
                withAnimation(.linear(duration: 1.3).delay(1).repeatForever()) {
                    animateInitialMessage = true
                }  
            }
        }
    }
}

#Preview {
    InitialView()
}
