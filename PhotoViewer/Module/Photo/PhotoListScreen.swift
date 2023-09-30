//
//  PhotoListScreen.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import SwiftUI

struct PhotoListScreen: View {
    @StateObject private var viewModel = PhotoListViewModel()

    var body: some View {
        List($viewModel.photos, id: \.id) { photo in
            NavigationLink {
                PhotoDetailScreen(photo: photo)
            } label: {
                PhotoListCell(photo: photo.wrappedValue)
            }
        }
        .navigationTitle("Photos")
    }
}
