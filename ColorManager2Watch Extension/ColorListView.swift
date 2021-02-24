//
//  ColorListView.swift
//  ColorManager2Watch Extension
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

struct ColorListView: View {
    @EnvironmentObject var colorModelData: ColorModelData
    @State private var showFav: Bool = false
    
    var filteredColors: [ColorModel] {
        colorModelData.colors.filter {
            color in
            (!showFav || color.isFav)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFav) {
                    Text("Favorites only")
                }
                ForEach(filteredColors, id: \.id) { color in
                    NavigationLink(destination: ColorDetailView(colorData: color)) {
                        ColorListRowView(color: color)
                    }
                }
            }.listStyle(CarouselListStyle())
            .navigationTitle("Colors")
            
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
