//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Matthew Lewis on 7/20/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        Text("Hello")
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
