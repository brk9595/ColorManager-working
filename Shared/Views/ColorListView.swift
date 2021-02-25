//
//  ColorListView.swift
//  ColorManager2
//
//  Created by Bharath Raj Kumar B on 24/02/21.
//

import SwiftUI

struct ColorListView: View {
    
    @EnvironmentObject var colorModelData: ColorModelData
    @State private var showFav: Bool = false
    @State private var selection: ColorModel?
    @State private var presentAddColorSheet: Bool = false
    
    var filteredColors: [ColorModel] {
        colorModelData.colors.filter {
            color in
            (!showFav || color.isFav)
        }
    }
    
    var index: Int? {
        colorModelData.colors.firstIndex(where: { $0.id == selection?.id })
    }
    
    var body: some View {
        EmptyView()
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView().environmentObject(ColorModelData())
    }
}
