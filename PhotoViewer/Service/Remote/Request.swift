//
//  Request.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

extension Remote {
    struct Request {
        let url: any URLConvertible
        var parameter: [String: String]?
        var header: [String: String]?
        var body: (any BodyConvertible)?
        let method: HTTPMethod

        init(
            url: any URLConvertible,
            header: [String: String]? = nil,
            parameter: [String: String]? = nil,
            body: (any BodyConvertible)? = nil,
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

        mutating func setBody(_ body: any BodyConvertible) {
            self.body = body
        }
    }
}
