//
//  PhotoListViewModel.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

final class PhotoListViewModel: ObservableObject {
    @Published var photos = [Photo]()

    private let photoService = PhotoService()

    init() {
        Task {
            await fetchPhoto()
        }
    }

    @MainActor
    private func fetchPhoto() async {
        do {
            photos = try await photoService.photos()
        } catch let error {
            print(error)
        }
    }
}
