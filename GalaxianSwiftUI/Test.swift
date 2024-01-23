//
//  Test.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 20/01/24.
//

import SwiftUI

struct Bullet: Identifiable {
    var id = UUID()
    var position: CGPoint
}

struct Test: View {
        @State private var shipPosition: CGPoint = CGPoint(x: 200, y: 500)
        @State private var bullets: [Bullet] = []

        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)

                    // Draw the spaceship
                    Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .position(shipPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    // Update the spaceship position based on drag gesture
                                    shipPosition = CGPoint(x: value.location.x, y: shipPosition.y)
                                }
                        )

                    // Draw the bullets
                    ForEach(bullets) { bullet in
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 5, height: 15)
                            .position(bullet.position)
                            .animation(.linear(duration: 0.5)) // Add animation
                    }
                }
                .onAppear {
                    // Start a timer to continuously append new bullets
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                        let newBullet = Bullet(position: CGPoint(x: shipPosition.x, y: shipPosition.y - 30))
                        bullets.append(newBullet)
                    }
                }
            }
        }
}

#Preview {
    Test()
}
