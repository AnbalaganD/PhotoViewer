//
//  RemoteError.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

enum RemoteError: Error {
    case invalidURL
    case invalidBody
    case parsingError(reason: String)
    case general(status: String, statusCode: Int)
}
