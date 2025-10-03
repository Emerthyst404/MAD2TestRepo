/*
* FILE:
* ASSIGNMENT: Assignment 1
* COURSE: PROG3230-25F-Sec1
* AUTHORS: Kalina Cathcart, Josh Horsley, Will Lee, Jack Prudnikowicz
* CREATION DATE: 10-01-2025
* DESCRIPTION: This code is responsible for displaying "My Plants" this file has the View for my plants and for
               selecting plants to add. When adding a new plant, you cann see all the plants from PlantData so
               make the selection. There is no ability to save the selection yet, my plants are lost when you
               refresh or go back. The next release of this prject may cover that... (default settings/JSON)
*/


import Foundation
import SwiftUI


struct MyPlantsView: View {
    @State private var myPlants: [Plant] = []
    @State private var showPicker = false

    var body: some View {
        VStack {
            if myPlants.isEmpty {
                Text("No plants yet")
                    .foregroundColor(.secondary)
                    .padding()
            } else {
                List {
                    ForEach(myPlants) { plant in
                        PlantRowView(plant: plant)
                    }
                    .onDelete { indexSet in
                        myPlants.remove(atOffsets: indexSet)
                    }
                }
            }
        }
        .navigationTitle("My Plants")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showPicker = true
                } label: {
                    Label("Add Plant", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showPicker) {
            PlantPickerView { picked in
                myPlants.append(picked)
                showPicker = false
            }
        }
    }
}


struct PlantPickerView: View {
    @Environment(\.dismiss) private var dismiss
    
    private let plants = plantEntries
    let onPick: (Plant) -> Void

    var body: some View {
        NavigationView {
            List {
                ForEach(plants) { plant in
                    Button {
                        onPick(plant)
                    } label: {
                        PlantRowView(plant: plant)
                    }
                }
            }
            .navigationTitle("Add a Plant")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}



//Previous code for MyPlantsView... No longer needed, not deleting yet incase I break something


// screen to display plants the user owns
//struct MyPlantsView: View {
//    var body: some View {
//        Text("My Plants Screen")
//            .navigationTitle("My Plants")
       
        // TODO: Add user's plant collection here
        // - A List of user's plants
        // - Care reminders?
        // - Add new plant button?
//    }
//}
