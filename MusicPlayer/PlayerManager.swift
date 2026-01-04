//
//  PlayerManager.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 1/1/26.
//

import SwiftUI
import Combine

class PlayerManager: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0
    @Published var bufferedTime: Double = 0
    @Published var currentTrackIndex: Int = 0
    @Published var tracks: [Track] = MockData.tracks

    var timer: Timer?

    var currentTrack: Track {
        get { tracks[currentTrackIndex] }
        set { tracks[currentTrackIndex] = newValue }
    }

    var duration: Double {
        currentTrack.durationInSeconds
    }

    func play() {
        isPlaying = true
        startTimer()
    }

    func pause() {
        isPlaying = false
        stopTimer()
    }

    func togglePlayPause() {
        isPlaying ? pause() : play()
    }

    func seek(to time: Double) {
        currentTime = time.clamped(to: 0...duration)
        bufferedTime = (currentTime + 30).clamped(to: 0...duration)
    }

    func loadTrack(at index: Int) {
        stopTimer()
        currentTrackIndex = index
        currentTime = 0
        bufferedTime = 0
        if isPlaying { startTimer() }
    }

    func next() {
        let nextIndex = (currentTrackIndex + 1) % tracks.count
        loadTrack(at: nextIndex)
    }

    func previous() {
        if currentTime < 5.0 {
            let prevIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
            loadTrack(at: prevIndex)
        }
        else {
            seek(to: 0)
        }
    }

    func toggleLike() {
        currentTrack.isLiked.toggle()
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.currentTime += 0.1
            // "Buffering" ahead by 30s
            self.bufferedTime = min(self.currentTime + 30, self.duration)

            if self.currentTime >= self.duration {
                self.next()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    deinit {
        stopTimer()
    }
}
