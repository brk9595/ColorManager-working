//
//  ColorBoxView.swift
//  ColorManager2TV
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

struct ColorBoxView: View {
    var color: ColorModel
    
    var body: some View {
        VStack {
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(hex: color.colorHex))
                    .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(Color.white, lineWidth: 4))
                    .frame(width: 500, height: 400)
            })
            .buttonStyle(CardButtonStyle())

            Text(color.colorHex).focusable()
        }
    }
}

struct ColorBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBoxView(color: ColorModelData().colors[0])
    }
}
