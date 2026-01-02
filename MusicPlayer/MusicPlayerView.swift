//
//  MusicPlayerView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct MusicPlayerView: View {
    @StateObject var player = PlayerManager()

    var body: some View {
        GeometryReader { geometry in

            // Screen dimensions
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            // Dimensions from spec
            let baseWidth: CGFloat = 480
            let baseHeight: CGFloat = 297
            
            // Defining scale variable to maintain aspect ratio between spec and screen's dimensions
            let scaleX = screenWidth / baseWidth
            let scaleY = screenHeight / baseHeight
            let scale = min(scaleX, scaleY)
            
            // Scaled dimensions
            let widgetWidth = baseWidth * 0.9 * scale
            let widgetHeight = baseHeight * 0.95 * scale
            
            VStack(spacing: 0) {
                HStack(alignment: .center, spacing: 32 * scale) {
                    AlbumArtworkView(artworkName: player.currentTrack.albumArt)
                        .frame(width: 88 * scale, height: 88 * scale)
                    TrackInfoView(track: player.currentTrack, scale: scale)
                }
                .padding(.horizontal, 32 * scale)
                .padding(.top, 32 * 1.4 * scale)
//                .frame(height: 120 * scale)
                
                Spacer()
                    .frame(height: 32 * scale)
                
                TimelineView(
                    currentTime: $player.currentTime,
                    duration: player.duration,
                    bufferedTime: player.bufferedTime,
                    onSeek: { time in player.seek(to: time) }
                )
                    .frame(width: 312 * 1.2 * scale)
                    .padding(.bottom, 16 * scale)

                PlaybackControlsView(scale: scale,
                                     isLiked: player.currentTrack.isLiked,
                                     isPlaying: player.isPlaying,
                                     onPlayPause: player.togglePlayPause,
                                     onNext: player.next,
                                     onPrevious: player.previous,
                                     onToggleFavorite: player.toggleFavorite)
                    .frame(width: 312 * 1.2 * scale)
                    .padding(.horizontal, 32 * scale)
                    .padding(.bottom, 32 * scale)
            }
            .frame(width: widgetWidth, height: widgetHeight)
            .background(Color.backgroundColor)
            .cornerRadius(16 * scale)
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
