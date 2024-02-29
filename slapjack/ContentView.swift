//
//  ContentView.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("c8") // Replace "yourImageName" with the actual name from the asset catalog
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            Text("Hi Im commiting from Patrick branch")
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
