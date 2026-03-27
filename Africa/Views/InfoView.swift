//
//  InfoView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 15) {
                        Text("🌍")
                            .font(.system(size: 60))
                            .shadow(radius: 3)
                        
                        Text("Über Afrika")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Entdecke den zweitgrößten Kontinent der Erde")
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    // Facts section
                    VStack(spacing: 20) {
                        Text("Interessante Fakten")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 15) {
                            FactCard(
                                icon: "globe",
                                title: "54 Länder",
                                description: "Afrika hat 54 anerkannte souveräne Staaten"
                            )
                            
                            FactCard(
                                icon: "person.3.fill",
                                title: "1.4 Milliarden",
                                description: "Menschen leben in Afrika (2023)"
                            )
                            
                            FactCard(
                                icon: "map.fill",
                                title: "30.3 Mio. km²",
                                description: "Fläche des afrikanischen Kontinents"
                            )
                            
                            FactCard(
                                icon: "leaf.fill",
                                title: "Biodiversität",
                                description: "Heimat von 25% aller Tierarten"
                            )
                        }
                    }
                    .padding()
                    
                    // Regions section
                    VStack(spacing: 20) {
                        Text("Afrikanische Regionen")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        VStack(spacing: 15) {
                            RegionInfoCard(
                                region: "Nordafrika",
                                countries: 7,
                                description: "Mediterrane Küste und Sahara"
                            )
                            
                            RegionInfoCard(
                                region: "Westafrika",
                                countries: 16,
                                description: "Tropische Regenwälder und Savannen"
                            )
                            
                            RegionInfoCard(
                                region: "Zentralafrika",
                                countries: 9,
                                description: "Kongo-Becken und Regenwälder"
                            )
                            
                            RegionInfoCard(
                                region: "Ostafrika",
                                countries: 14,
                                description: "Große Seen und Savannen"
                            )
                            
                            RegionInfoCard(
                                region: "Südliches Afrika",
                                countries: 8,
                                description: "Kapregion und Wüsten"
                            )
                        }
                    }
                    .padding()
                    
                    // Game info
                    VStack(spacing: 20) {
                        Text("Über das Spiel")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        VStack(spacing: 15) {
                            GameInfoCard(
                                title: "Einwohnerzahl",
                                description: "Vergleiche die Bevölkerungszahlen afrikanischer Länder",
                                icon: "person.2.fill"
                            )
                            
                            GameInfoCard(
                                title: "Landesfläche",
                                description: "Vergleiche die Größe der afrikanischen Länder",
                                icon: "map.fill"
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Info")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct FactCard: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct RegionInfoCard: View {
    let region: String
    let countries: Int
    let description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(region)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("\(countries) Länder")
                    .font(.caption)
                    .foregroundColor(.blue)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct GameInfoCard: View {
    let title: String
    let description: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    InfoView()
}
