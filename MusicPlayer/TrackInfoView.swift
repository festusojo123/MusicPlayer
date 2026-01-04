//
//  TrackInfoView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct TrackInfoView: View {
    let track: Track
    let scale: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * scale) {
            Text(track.title)
                .foregroundColor(.white)
                .font(.custom("GoogleSans-Medium", size: 24 * 0.85 * scale)) // TODO: noted i used font (24px per spec) and pixel size as 1:1 -> Designers typically work in @1x (base resolution), so their pixel measurements map directly to SwiftUI points. The system handles the actual pixel density automatically.
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: 312 * scale, alignment: .leading) // TODO: call out this discrpenacny - not using H from spec... for both tbh

            Text(track.artist)
                .foregroundColor(.white.opacity(0.5))
                .font(.custom("GoogleSansFlex_24pt-Medium", size: 16 * 0.925 * scale)) // TODO: Call out debate about Google Sans Text v Flex - https://en.wikipedia.org/wiki/Product_Sans
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: 312 * scale, alignment: .leading)
        }
//        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
