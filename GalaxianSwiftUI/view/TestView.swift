//
//  Test.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 20/01/24.
//


import SwiftUI

struct TestView: View {
    @State private var ship = CGPoint(x: 200, y: 500)
    @State private var enemy = CGPoint(x: 100, y: 100)
    @State private var direction1: CGFloat = 1
    @State private var direction2: CGFloat = 1

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Object 1
                Circle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                    .position(ship)
                
                // Object 2
                Rectangle()
                    .fill(.green)
                    .frame(width: 50, height: 50)
                    .position(enemy)
                
               
                    
                
            }
            .onAppear {
                //initial positions
                ship = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                enemy = CGPoint(x: geo.size.width / 2, y: geo.size.height / 4)
                
//                checkCollision()
               
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    enemy.y += 1 * direction1
//                    ship.x -= 1 * direction1
//                    enemy.x += 1 * direction2
                    checkCollision()

                }
            
                
            }
        }
    }



    func checkCollision() {
        let object1Rect = CGRect(origin: ship, size: CGSize(width: 50, height: 50))
        let object2Rect = CGRect(origin: enemy, size: CGSize(width: 50, height: 50))

        if object1Rect.intersects(object2Rect) {
            // Reverse the direction of motion upon collision
            direction1 *= -1
            direction2 *= -1
            print("colision")
        }
    }
}






#Preview {
    TestView()
}
