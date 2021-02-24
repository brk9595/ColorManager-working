//
//  ContentView.swift
//  ColorManager2 (macOS)
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ColorListView()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
