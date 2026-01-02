//
//  TimelineView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct TimelineView: View {
    @Binding var currentTime: Double
    let duration: Double
    let bufferedTime: Double
    let onSeek: (Double) -> Void

    @State var isDragging = false
    @State var dragValue: Double = 0

    var displayTime: Double {
        isDragging ? dragValue : currentTime
    }

    var progress: Double {
        displayTime / max(duration, 1)
    }

   var bufferedProgress: Double {
        bufferedTime / max(duration, 1)
    }

    var body: some View {
        VStack(spacing: 8) {
            // Custom slider
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Total duration
                    trackSlider(color: Color.barColor2 ?? .blue, width: geometry.size.width)
                    // Progress
                    trackSlider(color: Color.barColor ?? .blue, width: geometry.size.width * bufferedProgress)
                    trackSlider(color: .white, width: geometry.size.width * progress)
                    // Thumb
                    thumbSlider(offset: geometry.size.width * progress)
                        .gesture(dragGesture(width: geometry.size.width))
                }
            }
            .frame(height: 16)
            
            // Time details
            HStack {
                Text(timeString(from: displayTime))
                    .font(.custom("GoogleSans-Medium", size: 17))
                    .foregroundColor(.white.opacity(0.85))
                    .monospacedDigit()
                
                Spacer()
                
                Text(timeString(from: duration))
                    .font(.custom("GoogleSans-Medium", size: 17))
                    .foregroundColor(.white.opacity(0.85))
                    .monospacedDigit()
            }
        }
    }

    // MARK: - Custom Slider Helpers

    func trackSlider(color: Color, width: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(color)
            .frame(width: width, height: 4)
    }

    func thumbSlider(offset: CGFloat) -> some View {
        Circle()
            .fill(.white)
            .frame(width: 12, height: 12)
            .offset(x: offset)
    }

    func dragGesture(width: CGFloat) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                isDragging = true
                let progress = (value.location.x / width).clamped(to: 0...1)
                dragValue = progress * duration
            }
            .onEnded { value in
                let progress = (value.location.x / width).clamped(to: 0...1)
                onSeek(progress * duration)
                isDragging = false
            }
    }
}
