//
//  GameView.swift
//  slapjack
//
//  Created by Suhani Agrawal on 3/2/24.
//

import SwiftUI

// Dimensions and scale to ensure card size is adaptable to all devices
let height_scale = 1.45
let width_size = 100.0

struct GameView: View {
    var body: some View {
        VStack(spacing: 60) {
            VStack(spacing: 20) {
                Text("Machine")
                    .titleText()
                
                Image("back-deck")
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
            }
            
            VStack(spacing: 20) {
                Image("")
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
            }
            
            VStack(spacing: 20) {
                Image("back-deck")
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
                
                Text("Player")
                    .titleText()
            }
            
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color(red: 11/255.0, green: 110/255.0, blue: 26/255.0))
    }
}

#Preview {
    GameView()
}
