//
//  ColorManager2App.swift
//  Shared
//
//  Created by Bharath Raj Kumar B on 24/02/21.
//

import SwiftUI

@main
struct ColorManager2App: App {
    
    @StateObject private var colorModelData = ColorModelData()
    
    var body: some Scene {
        let mainWindow = WindowGroup {
            ContentView().environmentObject(colorModelData)
        }
        
        #if os(macOS)
        mainWindow
        #else
        mainWindow
        #endif
        
    }
}
