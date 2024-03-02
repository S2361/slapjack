//
//  Extensions.swift
//  slapjack
//
//  Created by Suhani Agrawal on 3/2/24.
//

import Foundation
import SwiftUI

extension Text {
    func titleText() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
    }
}
