//
//  PlaybackControlsView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct PlaybackControlsView: View {
    let scale: CGFloat
    let trackID: UUID
    let isLiked: Bool
    let isPlaying: Bool
    let onPlayPause: () -> Void
    let onNext: () -> Void
    let onPrevious: () -> Void
    let onToggleLike: () -> Void

    @State var shouldTriggerLikeAnimation = false
    @State var seenTrackIDs = Set<UUID>()

    var body: some View {
        HStack(spacing: 24 * scale) {

            Button(action: {}) {
                Image("figmaRepeat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white) // TODO: change color on click?
                    .frame(width: 36 * 0.5 * scale, height: 36 * 0.5 * scale)
            }.hoverEffect(.lift)

            Button(action: onPrevious) {
                Image("figmaSkipPrevious")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 36 * 0.95 * scale, height: 36 * 0.95 * scale)
            }.hoverEffect(.lift)

            Button(action: onPlayPause) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 28 * scale))
                    .foregroundColor(.white)
                    .frame(width: 72 * 0.8 * scale, height: 72 * 0.8 * scale)
                    .background(Color.selectedColor)
                    .clipShape(Circle())
                    .contentTransition(.symbolEffect(.replace))
                    .animation(.spring(response: 0.25, dampingFraction: 0.25), value: isPlaying)
            }.hoverEffect(.lift)

            Button(action: onNext) {
                Image("figmaSkipNext")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 36 * 0.95 * scale, height: 36 * 0.95 * scale)
            }.hoverEffect(.lift)

            Button(action: {
                withAnimation(.spring()) {
                    onToggleLike()
                }
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 17 * scale))
                    .foregroundColor(isLiked ? .red : .white)
                    .frame(width: 32 * scale, height: 32 * scale)
                    .animation(.easeInOut(duration: 0.2), value: shouldTriggerLikeAnimation)
                    .symbolEffect(.pulse, value: shouldTriggerLikeAnimation)

                    .onChange(of: isLiked) { oldValue, newValue in
                        if seenTrackIDs.contains(trackID) && !oldValue && newValue {
                            shouldTriggerLikeAnimation.toggle()
                        }
                    }

                    .onChange(of: trackID) {
                        seenTrackIDs.insert(trackID)
                    }
                    .onAppear {
                        seenTrackIDs.insert(trackID)
                    }
            }.hoverEffect(.lift)
        }
    }
}
