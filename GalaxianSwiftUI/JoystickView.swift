//
//  JoystickView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 20/01/24.
//

import SwiftUI

struct JoystickView: View {
    @State private var positionX = 50.0
    @Binding var movement : Double
    var body: some View {
        ZStack {
            
            Circle()
                .fill(.thinMaterial.opacity(0.5))
                .frame(width: 100, height: 100)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            
                            if value.translation.width > 0 && value.translation.width < 100 {
                                withAnimation {
                                    positionX = value.translation.width
                                }
                            }
                            
                            movement = value.translation.width > 50 ? 1 : -1
                            
                        }
                        .onEnded { _ in
                            movement = .zero
                            withAnimation {
                                positionX = 50
                            }
                        }
                )
            
            Circle()
                .fill(.white)
                .frame(width: 40, height: 40)
                .position(x: positionX, y: 50)
                
        }
        .frame(width: 100, height: 100)
        .background(.black)
    }
}

#Preview {
    JoystickView(movement: .constant(0))
}
