//
//  GameOverView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        ZStack {
                            // Background gradient - blue and white theme
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.1),
                        Color.white,
                        Color.blue.opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                // Game over title
                VStack(spacing: 20) {
                    Text("🎯")
                        .font(.system(size: 80))
                        .shadow(radius: 5)
                    
                    Text("Spiel beendet!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                // Score display
                VStack(spacing: 25) {
                    VStack(spacing: 10) {
                        Text("Deine Punktzahl")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        Text("\(gameManager.score)")
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                    }
                    
                    // High score indicator
                    if gameManager.score >= gameManager.highScore && gameManager.score > 0 {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                            Text("Neuer Rekord! 🎉")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    
                    // Previous high score
                    if gameManager.highScore > 0 {
                        VStack(spacing: 5) {
                            Text("Beste Punktzahl")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text("\(gameManager.highScore)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                        }
                    }
                }
                
                Spacer()
                
                // Action buttons
                VStack(spacing: 20) {
                    Button(action: { gameManager.startGame(mode: gameManager.gameMode) }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Nochmal spielen")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.blue)
                        )
                    }
                    
                    Button(action: { gameManager.resetGame() }) {
                        HStack {
                            Image(systemName: "house")
                            Text("Hauptmenü")
                        }
                        .font(.headline)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                

            }
            .padding()
        }
    }
}

#Preview {
    GameOverView(gameManager: GameManager())
}
