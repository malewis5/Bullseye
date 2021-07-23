//
//  SliderView.swift
//  Bullseye
//
//  Created by Matthew Lewis on 7/20/21.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    var sliderMin: Double
    var sliderMax: Double
    var sliderMinText: String
    var sliderMaxText: String
    
    var body: some View {
        HStack {
            SliderText(text: sliderMinText)          
            Slider(value: $sliderValue, in: sliderMin...sliderMax)
            SliderText(text: sliderMaxText)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    @State private var sliderValue = 50.0
    
    static var previews: some View {
        SliderView(sliderValue: .constant(50.0), sliderMin: 1.0, sliderMax: 100.0, sliderMinText: "1", sliderMaxText: "100")
    }
}
