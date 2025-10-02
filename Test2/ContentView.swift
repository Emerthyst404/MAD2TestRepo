/*
* FILE: 
* ASSIGNMENT: Assignment 1
* COURSE: PROG3230-25F-Sec1
* AUTHORS:
* CREATION DATE: 10-01-2025
* DESCRIPTION: 
*/

import SwiftUI


//Main Content View
struct ContentView: View {
    var body: some View {     
        NavigationView {        
            VStack(spacing: 30) {
                
                //Header Section
                VStack(spacing: 10) { 
                    
                    // Main title 
                    Text("Plant Care App")
                        .font(.system(size: 32, weight: .bold))  
                        .multilineTextAlignment(.center)  
                    
                    // Subtitle 
                    Text("Keep your plants healthy and thriving")
                        .font(.subheadline)  
                        .foregroundColor(.gray)  
                }
                .padding(.top, 60)  // 60 pts of space above header
                
                Spacer()
                
                
                
                //Navigation Buttons Section
                VStack(spacing: 20) {  
                    

                    NavigationLink(destination: PlantLibraryView()) {
                        
                        MenuButton(title: "Plant Library", color: .green)
                    }
                    
                    NavigationLink(destination: MyPlantsView()) {
                        MenuButton(title: "My Plants", color: .teal)
                    }
                    
                    NavigationLink(destination: CareGuideView()) {
                        MenuButton(title: "Care Guide", color: .blue)
                    }
                }
                .padding(.horizontal, 40)  // Add 40 pts of padding on left and right 
                
                // To push buttons toward the center of the screen
                Spacer()
            }
            .navigationBarHidden(true)  // Hide the default navigation bar at the top
        }
    }
}



// Menu Button 
struct MenuButton: View {
    
    let title: String   // button text 
    let color: Color    // background color of button
    
    var body: some View {
        
        // HStack = Horizontal Stack, arranges items side by side (left to right)
        HStack {
            
            Text(title)
                .font(.title3)  // same as title but smaller 
                .fontWeight(.semibold) // semi bold font 
            
            // push the text to the left side of the button
            Spacer()
        }
        .foregroundColor(.white)  // all text = white
        .padding()  // space inside the button around the text
        .frame(height: 60)  // button height = 60 points
        .background(color)  // sets color to what is passed in
        .cornerRadius(12)  // Round corners with a 12-point radius
    }
}


