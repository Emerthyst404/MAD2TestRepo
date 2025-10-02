/*
* FILE: PlantLibraryView.swift
* ASSIGNMENT: Assignment 1
* COURSE: PROG3230-25F-Sec1
* AUTHORS: Kalina Cathcart, Josh Horsley, Josh Rice, Christian Tan
* CREATION DATE: 10-01-2025
* DESCRIPTION: This file defines the structures of the plant library, defining the information stored and displayed of each plant. The user can search the list for a desired plant, and select plant enteries to see further details.
*/

import Foundation
import SwiftUI

// Struct: Plant
// Description: Models the structure for each plant entry in the library.
//      The 1st 3 attributes are visible in the list, and the rest are visible when the entry is expanded on.
struct Plant: Identifiable {
    let id = UUID()  // auto generateUnique id for each plant
    let name: String // common name for the plant
    let difficulty: String // care level for the plant
    let scientificName: String // Scientific name of the plant
    let wateringFrequency: String // watering frequency of the plant
    let sunlight: String // how much sunlight the plant will need
    let description: String // a description of the plant
}

// Struct: Plant Library View
// Description: Displays the searchable list of plant enteries, and expands into further detail on selection
struct PlantLibraryView: View {
    
    // Store search text entered by the user as it is entered
    @State private var searchText = ""
    
    // Pull in plant data from PlantData.swift
    private let plants = plantEntries
    
    
    
    // Search mechanics for filtering based on entered search criteria if any, all plants are shown if the field is empty
    var filteredPlants: [Plant] {
        
        if searchText.isEmpty {
            
            return plants
            
        } else {
            
            return plants.filter {
                
                $0.name.localizedCaseInsensitiveContains(searchText)
                
            }
        }
        
    }
    
    // Define the body of the main library view
    var body: some View {
        List {
            ForEach(filteredPlants) { plant in
                NavigationLink(destination: PlantDetailView(plant: plant)) {
                    PlantRowView(plant: plant)
                }
            }
        }
        .navigationTitle("Plant Library")
        .searchable(text: $searchText, prompt: "Search plants...")
    }
}

// Struct: Plant Row View
// Description: Defines the structure of each row in the list
struct PlantRowView: View {
    let plant: Plant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(plant.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(plant.scientificName)
                .font(.subheadline)
                .italic()
                .foregroundColor(.secondary)
            
            Text("Difficulty: \(plant.difficulty)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

// Struct: Plant Detail View
// Description: Defines the structure of the expanded entries
struct PlantDetailView: View {
    let plant: Plant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Plant Names
                VStack(alignment: .leading, spacing: 8) {
                    Text(plant.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(plant.scientificName)
                        .font(.title3)
                        .italic()
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                // Care Info
                VStack(alignment: .leading, spacing: 12) {
                    Text("Care Information")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    InfoRow(label: "Difficulty", value: plant.difficulty)
                    InfoRow(label: "Watering", value: plant.wateringFrequency)
                    InfoRow(label: "Sunlight", value: plant.sunlight)
                }
                
                Divider()
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(plant.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                }
                
                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("Plant Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Struct: Info Row Component
// Description: Used to display a single peice of label/value plant detail, reused multiple times to create a full plant entry 
struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(label):")
                .fontWeight(.semibold)
                .frame(width: 100, alignment: .leading)
            
            Text(value)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}
