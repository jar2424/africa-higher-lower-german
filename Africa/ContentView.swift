//
//  ContentView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameManager = GameManager()
    
    var body: some View {
        TabView {
            // Game Tab
            MenuView(gameManager: gameManager)
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Spiel")
                }
            
            // Countries Tab
            CountriesListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Länder")
                }
            
            // Info Tab
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Info")
                }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
