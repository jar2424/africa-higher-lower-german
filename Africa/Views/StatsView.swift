//
//  StatsView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct StatsView: View {
    @ObservedObject var gameManager: GameManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
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
                    // Header
                    VStack(spacing: 15) {
                        Text("📊")
                            .font(.system(size: 60))
                            .shadow(radius: 3)
                        
                        Text("Statistiken")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("Deine Spielerfolge")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    // Stats cards
                    VStack(spacing: 20) {
                        // High score card
                        VStack(spacing: 15) {
                            Text("🏆 Beste Punktzahl")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                            
                            Text("\(gameManager.highScore)")
                                .font(.system(size: 50, weight: .bold, design: .rounded))
                                .foregroundColor(.primary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                )
                                .shadow(color: .blue.opacity(0.1), radius: 10, x: 0, y: 5)
                        )
                        
                        // Game modes stats
                        VStack(spacing: 15) {
                            Text("Spielmodi")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                            
                            HStack(spacing: 20) {
                                StatCard(
                                    title: "Einwohnerzahl",
                                    icon: "person.2.fill",
                                    color: .blue
                                )
                                
                                StatCard(
                                    title: "Landesfläche",
                                    icon: "map.fill",
                                    color: .green
                                )
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                )
                                .shadow(color: .blue.opacity(0.1), radius: 10, x: 0, y: 5)
                        )
                        
                        // Info section
                        VStack(spacing: 15) {
                            Text("Über das Spiel")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                            
                            Text("Vergleiche afrikanische Länder und teste dein Wissen über Einwohnerzahlen und Landesflächen!")
                                .font(.body)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                                )
                                .shadow(color: .blue.opacity(0.1), radius: 10, x: 0, y: 5)
                        )
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .navigationTitle("Statistiken")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fertig") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}

struct StatCard: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(color.opacity(0.1))
        )
    }
}

#Preview {
    StatsView(gameManager: GameManager())
}
