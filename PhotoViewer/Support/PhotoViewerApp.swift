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
            if #available(iOS 16.0, *) {
                NavigationStack {
                    PhotoListScreen()
                }
            } else {
                NavigationView {
                    PhotoListScreen()
                        .navigationViewStyle(.stack)
                }
            }
        }
    }
}
