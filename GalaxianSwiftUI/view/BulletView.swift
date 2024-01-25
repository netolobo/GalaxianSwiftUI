//
//  BulletView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 22/01/24.
//

import SwiftUI

struct BulletView: View {
    @Binding var shipPositionX : CGFloat
    @State private var shipPositionY =  0.0
    var body: some View {
        GeometryReader { geo in
            Circle()
                .fill(.green)
                .frame(height: 10)
                .position(x: shipPositionX, y: shipPositionY)
                .onAppear {
                    shipPositionY = geo.size.height - 120
                    Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
                        
                        if shipPositionY > 0 {
                            shipPositionY -= 1
                        }else {
                            shipPositionY = geo.size.height - 120
                        }
                    }
                    
                    
                    //                    while shipPositionY > 0 {
                    //                        withAnimation(.linear.repeatForever(autoreverses: false)) {
                    //                            if shipPositionY > 0 {
                    //                                shipPositionY -= 1
                    //                            } else {
                    //                                shipPositionY = geo.size.height - 120
                    //                            }
                    //                        }
                    //                    }
                }
            
            //                .onChange(of: shipPositionX) {
            //                    withAnimation(.linear.repeatForever(autoreverses: false)) {
            //                        while shipPositionY > 0 {
            //                            shipPositionY -= 1
            //                        }
            //                    }
            //                }
        }
        
    }
}

#Preview {
    BulletView(shipPositionX: .constant(200.0))
}
