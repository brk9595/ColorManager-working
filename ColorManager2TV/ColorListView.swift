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
        EmptyView()
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
