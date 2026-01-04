//
//  PlayerManager.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 1/1/26.
//

import AVFoundation
import SwiftUI
import Combine

class PlayerManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0
    @Published var bufferedTime: Double = 0
    @Published var currentTrackIndex: Int = 0
    @Published var tracks: [Track] = MockData.tracks

    var timer: Timer?
    var audioPlayer: AVAudioPlayer?

    var currentTrack: Track {
        get { tracks[currentTrackIndex] }
        set { tracks[currentTrackIndex] = newValue }
    }

    var duration: Double {
        audioPlayer?.duration ?? currentTrack.durationInSeconds
    }

    override init() {
        super.init()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            NSLog("\(#function): Failed with \(error)")
        }
        loadTrack(at: 0)
    }

    func play() {
        audioPlayer?.play()
        isPlaying = true
        startTimer()
    }

    func pause() {
        audioPlayer?.pause()
        isPlaying = false
        stopTimer()
    }

    func togglePlayPause() {
        isPlaying ? pause() : play()
    }

    func seek(to time: Double) {
        let clampedTime = time.clamped(to: 0...duration)
        audioPlayer?.currentTime = clampedTime
        currentTime = clampedTime
    }

    func loadTrack(at index: Int) {
        stopTimer()
        currentTrackIndex = index

        guard let url = Bundle.main.url(forResource: currentTrack.audioPath, withExtension: "mp3") else {
            NSLog("\(#function): Could not find audio for \(currentTrack.title)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            currentTime = 0
        }
        catch {
            NSLog("\(#function): Playing audio for \(currentTrack.title) failed with \(error)")
        }

        if isPlaying {
            play()
        }
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
            if let player = self.audioPlayer {
                self.currentTime = player.currentTime
                // "Buffering" ahead by 30s
                self.bufferedTime = min(self.currentTime + 30, self.duration)
            }

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
