//
//  MusicPlayerView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct MusicPlayerView: View {
    var body: some View {
        GeometryReader { geometry in

            // Screen dimensions
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            // Dimensions from spec
            let baseWidth: CGFloat = 480
            let baseHeight: CGFloat = 297
            
            // Define `scale` to maintain aspect ratio between spec and screen's dimensions
            let scaleX = screenWidth / baseWidth
            let scaleY = screenHeight / baseHeight
            let scale = min(scaleX, scaleY)
            
            // Scaled dimensions
            let widgetWidth = baseWidth * 0.9 * scale
            let widgetHeight = baseHeight * scale
            
            VStack(spacing: 0) {
                // Album art + track info
                HStack(alignment: .center, spacing: 32 * scale) {
                    AlbumArtworkView()
                        .frame(width: 88 * scale, height: 88 * scale)
                    TrackInfoView(track: MockData.track1, scale: scale)
                }
                .padding(.horizontal, 32 * scale)
                .padding(.top, 32 * 1.4 * scale)
//                .frame(height: 120 * scale)
                
                Spacer()
                    .frame(height: 32 * scale)
                
                // Timeline + controls
                TimelineView()
                    .frame(width: 312 * 1.2 * scale)
                    .padding(.bottom, 16 * scale)

                PlaybackControlsView(scale: scale)
                    .frame(width: 312 * 1.2 * scale)
                    .padding(.horizontal, 32 * scale)
                    .padding(.bottom, 32 * scale)
            }
            .frame(width: widgetWidth, height: widgetHeight)
            .background(Color.backgroundColor)
            .cornerRadius(16 * scale)
//            .shadow(color: Color.black.opacity(0.1), radius: 8 * scale, x: 0, y: 4 * scale) // TODO: not needed?
            .position(x: screenWidth / 2, y: screenHeight / 2)
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview(traits: .landscapeLeft) {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
        MusicPlayerView()
    }
}
