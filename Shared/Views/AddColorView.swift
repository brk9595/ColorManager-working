//
//  AddColorView.swift
//  ColorManager2
//
//  Created by Bharath Raj Kumar B on 24/02/21.
//

import SwiftUI

struct AddColorView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var colorData: ColorModelData
    
    @State private var colorName: String = ""
    @State private var hexColor: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            getBackGroundColor(color: hexColor)
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .center) {
                    Spacer(minLength: 15)
                    TextField("Enter the color name", text: $colorName)
                        .padding(.horizontal)
                        .frame(height: 46 )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Enter the Color Code", text: $hexColor)
                        .padding(.horizontal)
                        .frame(height: 46 )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        if colorName.count > 0 && hexColor.count > 0 {
                            colorData.colors.append(getColorModel(for: colorName, hexCode: hexColor))
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            self.showAlert = true
                        }
                    }, label: {
                        Text("Submit")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.green))
                            .frame(height: 46)
                    }).alert(isPresented: self.$showAlert, content: {
                        presentAlert()
                    })
                }
            }
        }.navigationTitle("Add Color")
        .iOS { $0.navigationBarTitleDisplayMode(.inline) }
        
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
