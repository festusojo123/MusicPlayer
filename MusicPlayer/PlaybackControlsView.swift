//
//  PlaybackControlsView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct PlaybackControlsView: View {
    let scale: CGFloat
    @State private var isPlaying = false
    @State private var isLiked = false
    
    var body: some View {
        HStack(spacing: 20 * scale) {

            Button(action: {}) {
                Image(systemName: "repeat") // TODO: call out diff
                    .font(.system(size: 17 * scale))
                    .foregroundColor(.white) // TODO: change color on click?
                    .frame(width: 32 * scale, height: 32 * scale)
            }
            
            Button(action: {}) {
                Image(systemName: "backward.frame.fill")  // TODO: call out diff
                    .font(.system(size: 17 * scale))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .frame(width: 32 * scale, height: 32 * scale)
            }

            Button(action: { isPlaying.toggle() }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 28 * scale))
                    .foregroundColor(.white)
                    .frame(width: 64 * scale, height: 64 * scale)
                    .background(Color.selectedColor) // TODO: .background(Color.selectedColor ?? Color.blue)
                    .clipShape(Circle())
            }
            
            Button(action: {}) {
                Image(systemName: "forward.frame.fill")
                    .font(.system(size: 17 * scale))
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .frame(width: 32 * scale, height: 32 * scale)
            }

            Button(action: {
                withAnimation(.spring()) {
                    isLiked.toggle() // do we need both a button and in the data? maybe some come liked and we can unlike them? hook those up together?
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

#Preview {
    PlaybackControlsView(scale: 1.0)
}
