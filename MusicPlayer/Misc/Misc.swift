//
//  Misc.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 12/30/25.
//

import SwiftUI

extension Color {
    // Taken from https://medium.com/nerd-for-tech/from-hex-to-color-and-back-in-swiftui-b2398da68a29
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }

    static var backgroundColor: Color? {
        return Color(hex: "2e3240")
    }

    static var selectedColor: Color? {
        return Color(hex: "004a77")
    }

    static var barColor: Color? {
        return Color(hex: "96989f")
    }

    static var barColor2: Color? {
        return Color(hex: "585b66")
    }
}

// Taken from https://stackoverflow.com/a/40868784. https://developer.apple.com/documentation/swift/range/clamped(to:) exists but seems inaccessible for some reason.
extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

func timeString(from seconds: Double) -> String {
    let mins = Int(seconds) / 60
    let secs = Int(seconds) % 60
    return String(format: "%d:%02d", mins, secs)
}
