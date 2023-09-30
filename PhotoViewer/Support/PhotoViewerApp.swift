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
//            .onAppear {
//                test()
//            }
        }
    }

//    func test() {
//        Task {
//            try await ImageCacher.shared.load(from: "https://via.placeholder.com/150/3a6ebe")
//        }
//    }
}
