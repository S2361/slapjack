//
//  ContentView.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/27/24.
//

import SwiftUI

let height_scale = 1.45
let width_size = 100.0


struct ContentView: View {
    @StateObject var slapjackManager = SlapjackManager()
    
    // Dynamic variables to change state of screen when needed
    @State private var displayedCard: String = ""   // To change middle pile card
    @State private var playerCardCount: String = "26"   // Card count of player
    @State private var machineCardCount: String = "26"  // Card count of machine
    
    // Creating slapjack manager
    
    
    var body: some View {
        // Vertical stack for components on screen
        VStack(spacing: 50) {
            // Machine vertical stack (includes machine deck, machine card count, etc.)
            VStack(spacing: 20) {
                HStack {
                    Text("Card Count:")
                        .foregroundStyle(Color.white)
                        .bold()
                    
                    Text(machineCardCount)
                        .foregroundStyle(Color.white)
                        .bold()
                }
                
                Text("Machine")
                    .titleText()
                
                Image("back-deck")
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
            }
            
            // Middle Pile stack
            VStack(spacing: 20) {
                Image(displayedCard)
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
                    .onAppear {
                        // displayedCard = ____
                    }
            }
            
            // Player vertical stack (includes player deck, player card count, etc.)
            VStack(spacing: 20) {
                Image("back-deck")
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
                
                Text("Player")
                    .titleText()
                
                HStack {
                    Text("Card Count:")
                        .foregroundStyle(Color.white)
                        .bold()
                    
                    Text(playerCardCount)
                        .foregroundStyle(Color.white)
                        .bold()
                }
                
            }
            .onTapGesture {
                <#code#>
            }
            
        }
        .padding()
        .padding(.top, 30)
        .padding(.bottom, 30)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color(red: 11/255.0, green: 110/255.0, blue: 26/255.0))
    }
}

#Preview {
    ContentView()
}
