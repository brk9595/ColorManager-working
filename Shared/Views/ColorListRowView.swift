//
//  ColorListRowView.swift
//  ColorManager2
//
//  Created by Bharath Raj Kumar B on 24/02/21.
//

import SwiftUI

struct ColorListRowView: View {
    
    let color: ColorModel
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(hex: color.colorHex))
                .frame(width: 50, height: 50)
            
            Text(color.colorName)
                .bold()
            
            Spacer()
            
            if color.isFav {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct ColorListRowView_Previews: PreviewProvider {
    static var colors = ColorModelData().colors
    
    static var previews: some View {
        Group {
            ColorListRowView(color: colors[0])
            ColorListRowView(color: colors[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
