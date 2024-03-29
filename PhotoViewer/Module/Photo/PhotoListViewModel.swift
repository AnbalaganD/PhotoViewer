//
//  PhotoListViewModel.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

final class PhotoListViewModel: ObservableObject, @unchecked Sendable {
    @Published var photos = [Photo]()

    private let photoService = PhotoService()

    init() {
        fetchPhoto()
    }

    private func fetchPhoto() {
        Task { @MainActor in
            do {
                photos = try await photoService.photos()
            } catch let error {
                print(error)
            }
        }
    }
}
