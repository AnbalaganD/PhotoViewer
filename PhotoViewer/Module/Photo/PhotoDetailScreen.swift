//
//  PhotoDetailScreen.swift
//  PhotoViewer
//
//  Created by Anbalagan D on 30/09/23.
//

import SwiftUI

struct PhotoDetailScreen: View {
    @Binding var photo: Photo
    @State var editedTitle: String = ""
    @State private var isEditable = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CacheImage(url: photo.url) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                }

                VStack(alignment: .leading) {
                    Text("Title:")
                        .font(.system(size: 18, weight: .bold))

                    Text(photo.title)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .alert(
                    Text("Update Title"),
                    isPresented: $isEditable
                ) {
                    Button("Cancel", role: .cancel) {
                        editedTitle = photo.title
                        isEditable.toggle()
                    }

                    Button("Save") {
                        isEditable.toggle()
                        photo.title = editedTitle
                    }

                    TextField("", text: $editedTitle)
                }

                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditable.toggle()
                } label: {
                    Text(isEditable ? "Done" : "Edit Title")
                }
            }
        }
        .onAppear {
            editedTitle = photo.title
        }
    }
}
