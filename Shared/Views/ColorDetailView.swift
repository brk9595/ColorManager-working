//
//  ColorDetailView.swift
//  ColorManager2
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
        ZStack(alignment: .bottom) {
            Color(hex: colorData.colorHex)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text(colorData.colorName)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Text(colorData.colorHex)
                }
                .padding(.all, 30)
            }
            .background(Color.black.opacity(0.6))
            .toolbar {
                Button(action: {
                    colorModelData.colors[colorIndex].isFav =  !colorModelData.colors[colorIndex].isFav
                }, label: {
                    Image(systemName: colorModelData.colors[colorIndex].isFav ? "heart.fill" : "heart")
                        .foregroundColor(colorModelData.colors[colorIndex].isFav ? .yellow : .none)
                        .imageScale(.medium)
                })
            }
        }
    }
}

struct ColorDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        ColorDetailView(colorData: ColorModelData().colors[0])
    }
}
