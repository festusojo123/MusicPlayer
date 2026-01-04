//
//  PlaybackControlsView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct PlaybackControlsView: View {
    let scale: CGFloat
    let isLiked: Bool
    let isPlaying: Bool
    let onPlayPause: () -> Void
    let onNext: () -> Void
    let onPrevious: () -> Void
    let onToggleFavorite: () -> Void
    
    var body: some View {
        HStack(spacing: 24 * scale) {

            Button(action: {}) {
                Image("figmaRepeat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white) // TODO: change color on click?
                    .frame(width: 36 * 0.5 * scale, height: 36 * 0.5 * scale)
            }
            
            Button(action: onPrevious) {
                Image("figmaSkipPrevious")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 36 * 0.95 * scale, height: 36 * 0.95 * scale)
            }

            Button(action: onPlayPause) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 28 * scale))
                    .foregroundColor(.white)
                    .frame(width: 72 * 0.8 * scale, height: 72 * 0.8 * scale)
                    .background(Color.selectedColor ?? Color.blue) // TODO: is the ?? not needed? what about other similar callsites?
                    .clipShape(Circle())
            }
            
            Button(action: onNext) {
                Image("figmaSkipNext")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 36 * 0.95 * scale, height: 36 * 0.95 * scale)
            }

            Button(action: {
                withAnimation(.spring()) {
                    onToggleFavorite() // do we need both a button and in the data? maybe some come liked and we can unlike them? hook those up together?
                    // TODO: will this actually update music statE (if i unlike and play again is state preserved?) - i think so
                }
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 17 * scale))
                    .foregroundColor(.white) // TODO: does this work ? // extension - make red?
                    .frame(width: 32 * scale, height: 32 * scale)
            }
        }
//        .frame(minWidth: 350)
    }
}
