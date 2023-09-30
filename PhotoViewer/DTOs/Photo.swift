//
//  Photo.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import Foundation

struct Photo: Decodable {
    let id: Int
    let albumId: Int
    var title: String
    let url: String
    let thumbnailUrl: String
}
