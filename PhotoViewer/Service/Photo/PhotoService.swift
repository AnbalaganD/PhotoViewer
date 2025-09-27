//
//  PhotoService.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

final class PhotoService: Sendable {
    private let remoteService: any RemoteService
    init(remoteService: any RemoteService = Remote.sharedRemoteService) {
        self.remoteService = remoteService
    }

    func photos() async throws -> [Photo] {
        try await remoteService.execute(request: .init(url: EndPoint.photo))
    }
}
