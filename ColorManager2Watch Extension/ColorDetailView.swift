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
        EmptyView()
    }
}

struct ColorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ColorDetailView(colorData: ColorModelData().colors[0])
    }
}
