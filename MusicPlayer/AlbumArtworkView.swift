//
//  Image.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct AlbumArtworkView: View {
    let artworkName: String
    let fallback: String = "Fallback"

    var body: some View {
        if UIImage(named: artworkName) != nil {
            Image(artworkName)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        else {
            Image(fallback)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}
