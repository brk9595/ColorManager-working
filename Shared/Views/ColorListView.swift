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
        NavigationView {
            List(selection: $selection) {
                ForEach(filteredColors, id: \.id) { color in
                    NavigationLink(destination: ColorDetailView(colorData: color)) {
                        ColorListRowView(color: color)
                    }.tag(color)
                }
            }.navigationTitle("Colors")
            .toolbar {
                #if os(macOS)
                ToolbarItemGroup() {
                    Spacer()
                    
                    Button(action: {
                        self.presentAddColorSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }).sheet(isPresented: $presentAddColorSheet, content: {
                        AddColorView()
                            .frame(minWidth: 300, minHeight: 170)
                    })
                    
                    Button(action: {
                        self.showFav.toggle()
                        
                    }, label: {
                        Image(systemName: showFav ? "star.fill": "star").foregroundColor(.yellow)
                    })
                }
                #elseif os(iOS)
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    #if !os(watchOS)
                    NavigationLink(destination: AddColorView()) {
                        Button(action: {
                            self.showFav.toggle()
                        }, label: {
                            Image(systemName: "plus").foregroundColor(.yellow)
                        })
                    }
                    #endif
                    Button(action: {
                        self.showFav.toggle()
                    }, label: {
                        Image(systemName: showFav ? "star.fill": "star")
                    }).foregroundColor(.yellow)
                }
                #endif
            }
            
            
            Text("Select a Color")
        }
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView().environmentObject(ColorModelData())
    }
}
