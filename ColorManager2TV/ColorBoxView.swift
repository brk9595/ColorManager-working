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
        EmptyView()
    }
}

struct ColorBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBoxView(color: ColorModelData().colors[0])
    }
}
