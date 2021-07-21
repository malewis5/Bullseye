//
//  TextViews.swift
//  Bullseye
//
//  Created by Matthew Lewis on 7/20/21.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.title3)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instruction Text")
            BigNumberText(text: "Big Number Text")
            SliderText(text: "Slider Text")
        }
    }
}

