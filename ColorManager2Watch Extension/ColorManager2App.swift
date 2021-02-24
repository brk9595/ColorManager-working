//
//  ColorManager2App.swift
//  ColorManager2Watch Extension
//
//  Created by Bharath Raj Kumar B on 25/02/21.
//

import SwiftUI

@main
struct ColorManager2App: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
