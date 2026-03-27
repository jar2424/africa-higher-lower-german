//
//  GameManager.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import Foundation
import SwiftUI

enum GameMode: String, CaseIterable {
    case population = "Population"
    case area = "Area"
    
    var description: String {
        switch self {
        case .population:
            return "Einwohnerzahl"
        case .area:
            return "Landesfläche"
        }
    }
    
    var unit: String {
        switch self {
        case .population:
            return "Mio. Einwohner"
        case .area:
            return "km²"
        }
    }
}

enum GameState {
    case menu
    case playing
    case gameOver
}

class GameManager: ObservableObject {
    @Published var currentState: GameState = .menu
    @Published var gameMode: GameMode = .population
    @Published var score: Int = 0
    @Published var highScore: Int = 0
    @Published var currentCountry: AfricanCountry?
    @Published var nextCountry: AfricanCountry?
    @Published var gameHistory: [AfricanCountry] = []
    @Published var isCorrect: Bool?
    @Published var showResult: Bool = false
    
    private var availableCountries: [AfricanCountry] = []
    
    init() {
        loadHighScore()
        // Don't call resetGame() here to avoid initialization issues
        currentState = .menu
        score = 0
        currentCountry = nil
        nextCountry = nil
        gameHistory = []
        isCorrect = nil
        showResult = false
    }
    
    func startGame(mode: GameMode) {
        gameMode = mode
        score = 0
        gameHistory = []
        availableCountries = AfricanCountry.countries.shuffled()
        currentState = .playing
        nextRound()
    }
    
    func nextRound() {
        guard availableCountries.count >= 2 else {
            endGame()
            return
        }
        
        if currentCountry == nil {
            currentCountry = availableCountries.removeFirst()
        } else {
            currentCountry = nextCountry
        }
        
        nextCountry = availableCountries.removeFirst()
        isCorrect = nil
        showResult = false
    }
    
    func makeGuess(isHigher: Bool) {
        guard let current = currentCountry, let next = nextCountry else { return }
        
        let currentValue = getValue(for: current)
        let nextValue = getValue(for: next)
        
        let correctAnswer = nextValue > currentValue
        isCorrect = isHigher == correctAnswer
        
        if isCorrect == true {
            score += 1
            showResult = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.nextRound()
            }
        } else {
            // Game over after wrong answer
            showResult = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.endGame()
            }
        }
    }
    
    private func getValue(for country: AfricanCountry) -> Double {
        switch gameMode {
        case .population:
            return Double(country.population)
        case .area:
            return country.area
        }
    }
    
    func endGame() {
        currentState = .gameOver
        if score > highScore {
            highScore = score
            saveHighScore()
        }
    }
    
    func resetGame() {
        currentState = .menu
        score = 0
        currentCountry = nil
        nextCountry = nil
        gameHistory = []
        isCorrect = nil
        showResult = false
    }
    
    func formatValue(_ value: Double) -> String {
        switch gameMode {
        case .population:
            if value >= 1_000_000 {
                return String(format: "%.1f Mio.", value / 1_000_000)
            } else {
                return String(format: "%.0f", value)
            }
        case .area:
            if value >= 1_000_000 {
                return String(format: "%.0f Mio. km²", value / 1_000_000)
            } else if value >= 1_000 {
                return String(format: "%.0f T km²", value / 1_000)
            } else {
                return String(format: "%.0f km²", value)
            }
        }
    }
    
    private func loadHighScore() {
        highScore = UserDefaults.standard.integer(forKey: "HighScore")
    }
    
    private func saveHighScore() {
        UserDefaults.standard.set(highScore, forKey: "HighScore")
    }
}
