//
//  ColorDetailView.swift
//  ColorManager2Watch Extension
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

struct ColorDetailView: View {
    let colorData: ColorModel
    
    @EnvironmentObject var colorModelData: ColorModelData
    
    var colorIndex: Int {
        colorModelData.colors.firstIndex(where: { $0.id == colorData.id})!
    }
    
    var body: some View {
        ScrollView {
            Color(hex: colorData.colorHex)
                .frame( height: 100)
            VStack {
                VStack {
                    Text(colorData.colorName)
                        .bold()
                    Spacer()
                    Divider()
                    Text(colorData.colorHex)
                    Divider()
                    Button(action: {
                        colorModelData.colors[colorIndex].isFav =  !colorModelData.colors[colorIndex].isFav
                    }, label: {
                        Image(systemName: colorModelData.colors[colorIndex].isFav ? "heart.fill" : "heart")
                            .foregroundColor(colorModelData.colors[colorIndex].isFav ? .yellow : .none)
                            .imageScale(.small)
                    })
                }
                .padding(.all, 30)
            }
        }
    }
}

struct ColorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ColorDetailView(colorData: ColorModelData().colors[0])
    }
}
