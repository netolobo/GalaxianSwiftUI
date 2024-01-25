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
                
                //                HStack(spacing: 10) {
                ForEach(viewModel.backEnemies) { enemy in
                    EnemyView(enemy: enemy)
                    
                }
                //                }
                //                .frame(width: 260, height: 50)
                //                //                    .background(.white)
                //                .position(x: viewModel.enemiesPositionX, y: 90)
                
                //                    HStack(spacing: 10) {
                //                        ForEach(Enemy.middleEnemies) { enemy in
                //                            EnemyView(enemy: enemy)
                //                        }
                //                    }
                //                    .position(x: enemiesPositionX, y: 140)
                //
                //                    HStack(spacing: 10) {
                //                        ForEach(Enemy.frontEnemies) { enemy in
                //                            EnemyView(enemy: enemy)
                //                        }
                //                    }
                //                    .position(x: enemiesPositionX, y: 190)
                
                
                
                //                BulletView(shipPositionX: $shipPosition.x)
                
                Image(systemName: "arrow.up.square")
                    .frame(width: 50, height: 50)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .position(viewModel.shipPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.location.x > 25 && value.location.x < geo.size.width - 25 {
                                    withAnimation {
                                        viewModel.shipPosition = CGPoint(x: value.location.x, y: viewModel.shipPosition.y)
                                    }
                                }
                                
                            }
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .onAppear {
                
                viewModel.randomEnemy = viewModel.backEnemies.randomElement()!
                
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                    
                    if !viewModel.gameOver {
                        if viewModel.enemiesMovement == .right {
                            for i in 0..<viewModel.backEnemies.count {
                                viewModel.backEnemies[i].position.x += 1
                            }
                        } else {
                            for i in 0..<viewModel.backEnemies.count {
                                viewModel.backEnemies[i].position.x -= 1
                            }
                        }
                        
                        if viewModel.backEnemies[7].position.x >= geo.size.width - 12.5 {
                            viewModel.enemiesMovement = .left
                        }
                        
                        if viewModel.backEnemies[0].position.x <= 12.5 {
                            viewModel.enemiesMovement = .right
                        }
                    }
                }
                
                Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
                    if !viewModel.gameOver {
                        if let index = viewModel.backEnemies.firstIndex(where: { $0.id == viewModel.randomEnemy.id }) {
                            viewModel.lastEnemyRemoved = viewModel.backEnemies[index]
                            if viewModel.backEnemies[index].position.y < geo.size.height {
                                viewModel.backEnemies[index].position.y += 1
                                if viewModel.isCollision(index: index) {
                                    viewModel.gameOver = true
                                }
                            } else {
                                viewModel.score += 1
                                viewModel.backEnemies[index].position.y = viewModel.randomEnemy.position.y
                                viewModel.randomEnemy = viewModel.backEnemies.randomElement()!

                            }
  
                        }
                    }
                }
                
                
                
                
                //
                //                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
                //
                //                    ramdomEnemy = backEnemies.randomElement()
                
                //                    if let index = backEnemies.firstIndex(where: { $0.id == ramdomEnemy?.id }) {
                //                        withAnimation(viewModel.ramdomAnimation(duration: 0.5 + backEnemies[index].velocity)) {
                //                            lastEnemyRemoved = backEnemies[index]
                //                            backEnemies[index].position = CGPoint(x: shipPosition.x - 40, y: geo.size.height + 30)
                //
                //
                //                            let colision = viewModel.isCollision(rect1Origin: shipPosition, rect1Size: CGSize(width: 50, height: 50), rect2Origin: backEnemies[index].position, rect2Size: CGSize(width: backEnemies[index].size, height: backEnemies[index].size))
                //
                //                            if colision {
                //                                print("Colision")
                //                            }
                //                        }
                //
                //                        withAnimation(.linear.delay(1)) {
                //
                //                            backEnemies.remove(at: index)
                ////                            backEnemies[index].position = ramdomEnemy!.position
                //                        }
                ////
                //                        withAnimation(.linear.delay(1.01)) {
                //                            backEnemies.append(Enemy(color: .red, velocity: 0.5, position: lastEnemyRemoved!.position))
                //                        }
                //                    }
                //
                //
                //                    if backEnemies.isEmpty {
                //                        backEnemies = Enemy.backEnemies
                //                    }
                //
                //
                //                }
                
            }
            .alert("Game Over", isPresented: $viewModel.gameOver) {
                Button {
                    viewModel.resetGame()
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
