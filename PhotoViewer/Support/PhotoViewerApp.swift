//
//  PhotoViewerApp.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import SwiftUI

@main
struct PhotoViewerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PhotoListScreen()
            }
        }
    }
}
