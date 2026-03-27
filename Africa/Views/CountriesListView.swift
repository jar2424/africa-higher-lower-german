//
//  CountriesListView.swift
//  Africa
//
//  Created by Julius Rucha on 22.08.25.
//

import SwiftUI

struct CountriesListView: View {
    @State private var searchText = ""
    @State private var selectedRegion: String? = nil
    
    private let regions = ["West Africa", "East Africa", "North Africa", "Southern Africa", "Central Africa"]
    
    private var filteredCountries: [AfricanCountry] {
        var countries = AfricanCountry.countries
        
        if let region = selectedRegion {
            countries = countries.filter { $0.region == region }
        }
        
        if !searchText.isEmpty {
            countries = countries.filter { country in
                country.name.localizedCaseInsensitiveContains(searchText) ||
                country.capital.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return countries.sorted { $0.name < $1.name }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                // Region filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        RegionFilterButton(
                            title: "Alle",
                            isSelected: selectedRegion == nil,
                            action: { selectedRegion = nil }
                        )
                        
                        ForEach(regions, id: \.self) { region in
                            RegionFilterButton(
                                title: region,
                                isSelected: selectedRegion == region,
                                action: { selectedRegion = region }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                // Countries list
                List(filteredCountries) { country in
                    CountryRowView(country: country)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Afrikanische Länder")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Land oder Hauptstadt suchen...", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct RegionFilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white : .primary)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CountryRowView: View {
    let country: AfricanCountry
    
    var body: some View {
        HStack(spacing: 15) {
            // Flag
            Text(country.flag)
                .font(.title)
                .shadow(radius: 2)
            
            // Country info
            VStack(alignment: .leading, spacing: 4) {
                Text(country.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(country.capital)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(country.region)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Population and area
            VStack(alignment: .trailing, spacing: 4) {
                Text(formatPopulation(country.population))
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Text(formatArea(country.area))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func formatPopulation(_ population: Int) -> String {
        if population >= 1_000_000 {
            return String(format: "%.1f Mio.", Double(population) / 1_000_000)
        } else {
            return String(format: "%.0f", Double(population))
        }
    }
    
    private func formatArea(_ area: Double) -> String {
        if area >= 1_000_000 {
            return String(format: "%.0f Mio. km²", area / 1_000_000)
        } else if area >= 1_000 {
            return String(format: "%.0f T km²", area / 1_000)
        } else {
            return String(format: "%.0f km²", area)
        }
    }
}

#Preview {
    CountriesListView()
}
