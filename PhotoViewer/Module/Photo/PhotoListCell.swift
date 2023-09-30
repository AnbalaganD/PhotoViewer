//
//  PhotoListCell.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import SwiftUI

struct PhotoListCell: View {
    let photo: Photo

    var body: some View {
        HStack {
            CacheImage(url: photo.thumbnailUrl) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(3)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }

            Text(photo.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
