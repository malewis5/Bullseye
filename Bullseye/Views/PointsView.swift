//
//  PointsView.swift
//  Bullseye
//
//  Created by Matthew Lewis on 7/23/21.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.calculatePoints(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n 🎉🎉🎉")
            Button(action: {
                withAnimation {
                    game.startNewRound(points: points)
                    alertIsVisible = false
                }
            }, label: {
                AlertButtonText(text: "Start New Round")
            })
        }
        .padding()
        .frame(maxWidth: 315)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(game: .constant(Game()), sliderValue: .constant(50.0), alertIsVisible: .constant(true))
        PointsView(game: .constant(Game()), sliderValue: .constant(50.0), alertIsVisible: .constant(true))
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(game: .constant(Game()), sliderValue: .constant(50.0), alertIsVisible: .constant(true))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        PointsView(game: .constant(Game()), sliderValue: .constant(50.0), alertIsVisible: .constant(true))
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
