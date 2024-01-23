//
//  ContentView.swift
//  GalaxianSwiftUI
//
//  Created by Neto Lobo on 20/01/24.
//

import SwiftUI

struct GameView: View {
    @State private var shipPosition: CGPoint = CGPoint(x: 200, y: 500)
    @State private var enemiesPositionX = 120.0
    @State private var enemiesMovement = EnemiesMovement.right
    @State private var backEnemies = Enemy.backEnemies
    @State private var ramdomEnemy : Enemy?
    @State private var lastEnemyRemoved : Enemy?
    var body: some View {
        GeometryReader() { geo in
            ZStack {
                
                Text("Ship X position = \(shipPosition.x)")
                    .position(x: geo.size.width / 2, y: 20)
                    .foregroundStyle(.white)
                
                Text("Enemy X position = \(enemiesPositionX)")
                    .position(x: geo.size.width / 2, y: 40)
                    .foregroundStyle(.white)
                
                    HStack(spacing: 10) {
                        ForEach(backEnemies, id: \.id) { enemy in
                            EnemyView(color: enemy.color, size: enemy.size, position: enemy.position)
                        }
                    }
                    .frame(width: 280, height: 50)
                    .background(.white)
                    .position(x: enemiesPositionX, y: 90)
                    
                    HStack(spacing: 10) {
                        ForEach(Enemy.middleEnemies, id: \.id) { enemy in
                            EnemyView(color: enemy.color, size: enemy.size, position: enemy.position)
                        }
                    }
                    .position(x: enemiesPositionX, y: 140)
                    
                    HStack(spacing: 10) {
                        ForEach(Enemy.frontEnemies, id: \.id) { enemy in
                            EnemyView(color: enemy.color, size: enemy.size, position: enemy.position)
                        }
                    }
                    .position(x: enemiesPositionX, y: 190)
          
                
                
//                BulletView(shipPositionX: $shipPosition.x)
                
                Image(systemName: "globe")
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .position(x: shipPosition.x, y: shipPosition.y)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.location.x > 25 && value.location.x < geo.size.width - 25 {
                                    withAnimation {
                                        shipPosition = CGPoint(x: value.location.x, y: shipPosition.y)
                                    }
                                }
                                                                
                            }
                    )
                    
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .onAppear {
                shipPosition = CGPoint(x: geo.size.width / 2, y: geo.size.height - 130)
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    
                    if enemiesMovement == .right {
                        enemiesPositionX += 1
                    } else {
                        enemiesPositionX -= 1
                    }
                    
                    if enemiesPositionX == geo.size.width - 140{
                        enemiesMovement = .left
                    }
                    
                    if enemiesPositionX == 140 {
                        enemiesMovement = .right
                    }
                }
                

                
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
                    
                    ramdomEnemy = backEnemies.randomElement()
                    if let index = backEnemies.firstIndex(where: { $0.id == ramdomEnemy?.id }) {
                        withAnimation(.linear(duration: 0.5 + backEnemies[index].velocity)) {
                            lastEnemyRemoved = backEnemies[index]
                            backEnemies[index].position = CGPoint(x: shipPosition.x - 40, y: geo.size.height + 30)
                            print("Position x from ship= \(shipPosition.x)")
                            print("Position y grom ship= \(geo.size.height + 30)")
                            print("Position x passed to enemy= \(backEnemies[index].position.x)")
                            print("Position y passed to enemy= \(backEnemies[index].position.y)")
                            
                        }
                        withAnimation(.linear.delay(1.01)) {
                            
                            backEnemies.remove(at: index)
                        }
                        
                        withAnimation(.linear.delay(1.3)) {
                            backEnemies.append(Enemy(color: .red, velocity: 0.5, position: lastEnemyRemoved!.position))
                        }
                        
                        
                    }
 
                    
                }
                
            }
            
        }
    }
}

#Preview {
    GameView()
}
