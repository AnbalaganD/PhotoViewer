//
//  Request.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

extension Remote {
    struct Request {
        let url: URLConvertible
        var parameter: [String: String]?
        var header: [String: String]?
        var body: BodyConvertible?
        let method: HTTPMethod

        init(
            url: URLConvertible,
            header: [String: String]? = nil,
            parameter: [String: String]? = nil,
            body: BodyConvertible? = nil,
            method: HTTPMethod = .get
        ) {
            self.url = url
            self.parameter = parameter
            self.header = header
            self.body = body
            self.method = method
        }

        mutating func addHeader(key: String, value: String) {
            if header == nil {
                header = [:]
            }
            header?[key] = value
        }

        mutating func addParameter(key: String, value: String) {
            if parameter == nil {
                parameter = [:]
            }
            parameter?[key] = value
        }

        mutating func setBody(_ body: BodyConvertible) {
            self.body = body
        }
    }
}
