//
//  ColorListView.swift
//  ColorManager2TV
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

struct ColorListView: View {
    @EnvironmentObject var colorModelData: ColorModelData
    
    let columns = [
        GridItem(.fixed(500)),
        GridItem(.fixed(500))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 50) {
                    ForEach(colorModelData.colors, id: \.id) { color in
                        ColorBoxView(color: color)
                    }
                } .padding(.all)
            }.navigationTitle("Colors")
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
