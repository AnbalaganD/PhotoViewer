//
//  URLConvertible.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

protocol URLConvertible: Sendable {
    func asURL() -> URL?
}

extension URLConvertible where Self == String {
    func asURL() -> URL? {
        URL(string: self)
    }
}

extension URLConvertible where Self == URL {
    func asURL() -> URL? {
        self
    }
}

extension String: URLConvertible { }

extension URL: URLConvertible { }
