//
//  MenuView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        NavigationView {
            Group {
                switch gameManager.currentState {
                case .menu:
                    MenuContentView(gameManager: gameManager)
                case .playing:
                    GameView(gameManager: gameManager)
                case .gameOver:
                    GameOverView(gameManager: gameManager)
                }
            }
        }
    }
}

struct MenuContentView: View {
    @ObservedObject var gameManager: GameManager
    @State private var showStats = false
    
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
            
            VStack(spacing: 30) {
                // Settings button
                HStack {
                    Spacer()
                    Button(action: { showStats = true }) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // African characters greeting section
                VStack(spacing: 20) {
                    HStack(spacing: 15) {
                        // First character
                        VStack {
                            Text("👨🏾‍🦱")
                                .font(.system(size: 60))
                                .shadow(radius: 3)
                            Text("Hallo!")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                        
                        // Second character
                        VStack {
                            Text("👩🏾‍🦱")
                                .font(.system(size: 60))
                                .shadow(radius: 3)
                            Text("Willkommen!")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                        
                        // Third character
                        VStack {
                            Text("👶🏾")
                                .font(.system(size: 60))
                                .shadow(radius: 3)
                            Text("Jambo!")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                    }
                    .padding(.horizontal)
                    
                    // App title
                    VStack(spacing: 10) {
                        Text("🗺️")
                            .font(.system(size: 50))
                            .shadow(radius: 3)
                        
                        Text("Afrika Quiz")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("Lerne Afrika kennen")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Spacer()
                
                // Game mode selection
                VStack(spacing: 20) {
                    Text("Wähle dein Spiel")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    ForEach(GameMode.allCases, id: \.self) { mode in
                        GameModeButton(
                            mode: mode,
                            action: { gameManager.startGame(mode: mode) }
                        )
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showStats) {
            StatsView(gameManager: gameManager)
        }
    }
}

struct GameModeButton: View {
    let mode: GameMode
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mode.description)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    Text(mode.unit)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
                    .font(.title2)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(color: .blue.opacity(0.1), radius: 5, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    MenuView(gameManager: GameManager())
}
