//
//  HTTPURLResponseExtension.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

extension HTTPURLResponse {
    var isSuccess: Bool { 200 ... 299 ~= statusCode }
}
