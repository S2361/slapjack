//
//  ContentView.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/27/24.
//

import SwiftUI

let height_scale = 1.45
let width_size = 100.0
let bgColor = Color(red: 11/255.0, green: 110/255.0, blue: 26/255.0, opacity: 1.0) // Define a custom color

struct ContentView: View {
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            Image("2_of_diamonds.png")
            VStack {
                // 1 : 1.45
                Image("2_of_clubs") // Replace "yourImageName" with the actual name from the asset catalog
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
                Text("Hi Im commiting from Patrick branch")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
