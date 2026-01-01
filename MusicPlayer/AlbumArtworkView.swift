//
//  Image.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct AlbumArtworkView: View {
    var body: some View {
        Image("PurpleNoon") // TODO: replaceme, also add default image for songs without artwork
            .frame(width: 88, height: 88)
    }
}

#Preview {
    AlbumArtworkView()
}
