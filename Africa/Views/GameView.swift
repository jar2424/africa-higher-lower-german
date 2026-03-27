//
//  GameView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct GameView: View {
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
            
            VStack(spacing: 0) {
                // Header with score and game mode
                GameHeader(gameManager: gameManager)
                
                Spacer()
                
                if let currentCountry = gameManager.currentCountry {
                    // Current country card - always show value
                    CountryCard(
                        country: currentCountry,
                        gameMode: gameManager.gameMode,
                        isCurrent: true,
                        gameManager: gameManager,
                        showValue: true
                    )
                    
                    // VS indicator
                    VStack(spacing: 10) {
                        Text("VS")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        
                        Text("Hat das nächste Land mehr oder weniger?")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    // Next country card (hidden initially)
                    if let nextCountry = gameManager.nextCountry {
                        CountryCard(
                            country: nextCountry,
                            gameMode: gameManager.gameMode,
                            isCurrent: false,
                            gameManager: gameManager,
                            showValue: gameManager.showResult
                        )
                    }
                    
                    Spacer()
                    
                    // Action buttons
                    if !gameManager.showResult {
                        HStack(spacing: 20) {
                            ActionButton(
                                title: "Weniger",
                                icon: "arrow.down.circle.fill",
                                color: .red,
                                action: { gameManager.makeGuess(isHigher: false) }
                            )
                            
                            ActionButton(
                                title: "Mehr",
                                icon: "arrow.up.circle.fill",
                                color: .green,
                                action: { gameManager.makeGuess(isHigher: true) }
                            )
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct GameHeader: View {
    @ObservedObject var gameManager: GameManager
    
    var body: some View {
        HStack {
            Button(action: { gameManager.resetGame() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("Punktzahl")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("\(gameManager.score)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            VStack(spacing: 4) {
                Text("Modus")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(gameManager.gameMode.description)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

struct CountryCard: View {
    let country: AfricanCountry
    let gameMode: GameMode
    let isCurrent: Bool
    let gameManager: GameManager
    var showValue: Bool = false
    
    var body: some View {
        VStack(spacing: 15) {
            // Flag and country name
            VStack(spacing: 10) {
                Text(country.flag)
                    .font(.system(size: 60))
                    .shadow(radius: 3)
                
                Text(country.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text(country.capital)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            // Value display
            if showValue {
                VStack(spacing: 5) {
                    Text(gameManager.formatValue(getValue()))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(gameMode.unit)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .transition(.scale.combined(with: .opacity))
            } else {
                Text("???")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        .scaleEffect(isCurrent ? 1.0 : 0.9)
        .animation(.easeInOut(duration: 0.3), value: showValue)
    }
    
    private func getValue() -> Double {
        switch gameMode {
        case .population:
            return Double(country.population)
        case .area:
            return country.area
        }
    }
}

struct ActionButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(color)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    GameView(gameManager: GameManager())
}
