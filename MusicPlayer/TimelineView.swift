//
//  TimelineView.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/29/25.
//

import SwiftUI

struct TimelineView: View {
    @State private var sliderPosition: Double = 132
    
    var body: some View {
        VStack(spacing: 8) {
            Slider(value: $sliderPosition, in: 0...350) //TODO: duration
                .tint(.white)
            
            // TODO: extension - make custom slider - eh or do it ?
            
            HStack {
                Text("2:12") // TODO: hardcode/be able to slide?
                    .font(.system(size: 18)).bold()
                    .foregroundColor(.white.opacity(0.75))
                
                Spacer()
                
                Text("5:11")
                    .font(.system(size: 18)).bold()
                    .foregroundColor(.white.opacity(0.75))
            }
        }
    }
}

#Preview {
    TimelineView()
}
