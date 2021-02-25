//
//  AddColorView.swift
//  ColorManager2 (macOS)
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

struct AddColorView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var colorData: ColorModelData
    
    @State private var colorName: String = ""
    @State private var hexColor: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        EmptyView()
        
    }
    
    func getColorModel(for name: String, hexCode: String) -> ColorModel {
        ColorModel(id: Int.random(in: 0..<100), colorName: name, colorHex: hexCode, isFav: false)
    }
    
    func getBackGroundColor(color: String) -> Color {
        if color.count > 5 {
            return Color(hex: color)
        } else {
            return Color.clear
        }
    }
    
    func presentAlert() -> Alert {
        Alert(title: Text("Error"), message: Text("Invalid Color name/String"), dismissButton: .default(Text("OK")))
    }
}

struct AddColorView_Previews: PreviewProvider {
    static var previews: some View {
        AddColorView()
    }
}
