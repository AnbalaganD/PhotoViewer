//
//  ImageCacher.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation
import SwiftUI

final class ImageCacher: ObservableObject {
    private let cache = Cache.shared
    private let urlSession: URLSession

    static let shared = ImageCacher()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func load(from url: URLConvertible) async throws -> Data {
        guard let url = url.asURL() else { throw CacheError.invalidURL }

        if let imageData = cache.retrive(key: url.absoluteString) {
            return imageData
        }

        let (data, _) = try await urlSession.data(for: URLRequest(url: url))
        cache.storeData(data: data, forKey: url.absoluteString)
        return data
    }
}

extension ImageCacher {
    enum CacheError: Error {
        case invalidURL
    }
}
