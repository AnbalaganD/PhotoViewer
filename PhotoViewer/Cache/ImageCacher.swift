//
//  ImageCacher.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

final class ImageCacher: Sendable {
    private let cache = Cache.shared
    private let urlSession: URLSession

    static let shared = ImageCacher()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func load(from url: URLConvertible) async throws -> Data {
        guard let url = url.asURL() else { throw CacheError.invalidURL }

        if let imageData = cache.retrive(key: url.absoluteString) {
            let decompressedData = try imageData.decompressed(using: .brotli)
            return decompressedData
        }

        let (data, _) = try await urlSession.data(from: url)
        let compressedData = try data.compressed(using: .brotli)
        cache.store(data: compressedData, forKey: url.absoluteString)
        return data
    }
}

extension ImageCacher {
    enum CacheError: Error {
        case invalidURL
    }
}
