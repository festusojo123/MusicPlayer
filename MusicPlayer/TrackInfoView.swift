//
//  TrackInfoView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI
import MarqueeText

struct TrackInfoView: View {
    let track: Track
    let scale: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12 * scale) {
            MarqueeText(text: track.title,
                        font: UIFont.titleText(scale: scale),
                        leftFade: 16,
                        rightFade: 16,
                        startDelay: 3)
                .foregroundColor(.white)
                .frame(maxWidth: 312 * scale, maxHeight: 24 * scale, alignment: .leading)
                .hoverEffect(.lift)

            ReversedMarqueeText(text: track.artist,
                                font: UIFont.artistText(scale: scale),
                                leftFade: 16,
                                rightFade: 16,
                                startDelay: 3)
                .foregroundColor(.white.opacity(0.5))
                .frame(maxWidth: 312 * scale, maxHeight: 16 * scale, alignment: .leading)
                .hoverEffect(.lift)
        }
    }
}
