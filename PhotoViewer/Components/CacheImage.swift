//
//  CacheImage.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import SwiftUI

struct CacheImage<Content: View, Placeholder: View>: View {
    private let imageCacher = ImageCacher.shared
    @State private var imageData: Data?

    let url: URLConvertible
    let content: (Image) -> Content
    let placeholder: () -> Placeholder

    var body: some View {
        loadContent()
            .task { await getImage() }
    }

    @ViewBuilder
    private func loadContent() -> some View {
        if let imageData, let image = Image(data: imageData) {
            content(image)
        } else {
            placeholder()
        }
    }

    private func getImage() async {
        do {
            imageData = try await imageCacher.load(from: url)
        } catch let error {
            print(error)
        }
    }
}
