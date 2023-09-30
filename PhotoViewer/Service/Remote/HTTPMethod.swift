//
//  HTTPMethod.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

struct HTTPMethod {
    let rawValue: String

    static let get = HTTPMethod(rawValue: "GET")

    static let post = HTTPMethod(rawValue: "POST")
}
