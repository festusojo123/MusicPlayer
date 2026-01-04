//
//  Track.swift
//  MusicPlayer
//
//  Created by Festus Ojo on 1/1/26.
//

import SwiftUI

struct Track: Identifiable {
    let id: UUID
    let title: String
    let artist: String
    let albumArt: String
    let audioPath: String
    let durationInSeconds: TimeInterval
    var isLiked: Bool
}

struct MockData {
    static let track1 = Track(id: UUID(),
                              title: "Black Friday (pretty like the sun)",
                              artist: "Lost Frequencies, Tom Odell, Poppy Baskcomb",
                              albumArt: "PurpleNoon",
                              audioPath: "BlackFridayPrettyLikeTheSun",
                              durationInSeconds: 311,
                              isLiked: false)

    static let track2 = Track(id: UUID(),
                              title: "Get Lucky",
                              artist: "Daft Punk, Pharrell Williams, Nile Rodgers",
                              albumArt: "RandomAccessMemories",
                              audioPath: "GetLucky",
                              durationInSeconds: 247,
                              isLiked: false)

    static let track3 = Track(id: UUID(),
                              title: "I Just Called to Say I Love You",
                              artist: "Stevie Wonder",
                              // I'm not adding the art for this song to the Xcode project to test the missing art fallback
                              albumArt: "TheWomanInRed",
                              audioPath: "IJustCalledToSayILoveYou",
                              durationInSeconds: 261,
                              isLiked: true)

    static let track4 = Track(id: UUID(),
                              title: "Just the Way You Are",
                              artist: "Bruno Mars",
                              albumArt: "DooWops",
                              audioPath: "JustTheWayYouAre",
                              durationInSeconds: 220,
                              isLiked: false)

    static let track5 = Track(id: UUID(),
                              title: "Hey Ya!",
                              artist: "Outkast",
                              albumArt: "HeyYa",
                              audioPath: "HeyYa",
                              durationInSeconds: 235,
                              isLiked: false)
    
    static let tracks = [track1, track2, track3, track4, track5]
}
