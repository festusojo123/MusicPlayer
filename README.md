# Embedded Music Player

## SwiftUI Mobile Prototype

Fully functional music player prototype with real audio playback and interactive controls.

**[📹 Watch Demo Video](https://www.youtube.com/watch?v=bTywBGV7D3Q)**

Video also available in repository [here](https://github.com/festusojo123/MusicPlayer/blob/main/Festus-GDM-Design.mov).

## Core Features
- Basic playback control (play, pause, next, previous)
- Displays song information
- Scrubbing to skip around track's runtime with accurate timestamps
- Added "Like" and "Repeat" buttons

## Technical Approach
Uses SwiftUI to follow Figma spec. Relies on SF Symbols where available, otherwise, exported specific symbols, like "repeat" from Figma as SVG files that seemed custom. Used 3 custom Google fonts (GoogleSans-Medium, GoogleSansFlex-24pt-Medium, and GoogleSans-SemiBold). 

## Enhancements
- Real music support using AVAudioPlayer. I chose to use a Swift Timer instead of Combine for smoother progress bar updates.
- All buttons (and text) respond to user hovering
- Support for missing album art
- Rewind button restarts current song if more than 5 seconds have played, otherwise goes to actual previous track 
- There is an animation and change in color when liking a song. I chose red similar to Spotify's green checks for "saved" songs. Liking/unliking a song is also state that is preserved. 
- Used marquee wraparound text for long titles/artists so users can eventually see entirety of text

## Design Tradeoffs
- I decided to use marquee wraparound text rather than truncating it as in spec. This was similar to what I saw in other music players like Spotify.
- For the artist info font, I used Google Sans Flex instead of Google Sans Text like the spec mentions. I saw discussion online and read https://en.wikipedia.org/wiki/Product_Sans. It seems Flex was made public recently, but I didn’t see Text on https://fonts.google.com. 
- For the song's timestamps, I tried a few different sizes and fonts from GoogleSans and GoogleSansFlex, but landed on GoogleSans-SemiBold.
- SwiftUI's fonts are measured in "points", but the spec is in px. I read that SwiftUI should handle the actual pixel density automatically.

## Future Improvements
With more time:
- Include more song info/metadata, and make the album art expandable on click

With input from designers:
- Allow for looping a single song repeatedly, and more animations when clicking the repeat button.
- Add share, queue, add to playlist, and lyric sync up functionality. A queue would be a nice place to insert personalized song recommendations.

Making this production-ready:
- Localization (ie. supporting other languages, and testing other device and screen types)
- Unit testing, as well as edge cases (handling errors for corrupted or missing audio or stalled audio that's being streamed live)
- Continue playing the audio in the background when the app is closed
- User behavior studies for real feedback 

## Running the Project
To run via Xcode on a physical device, download the project, and hit the Play icon.

You can also use an iPad Simulator. Hovering can be enabled by selecting "I/O" -> "Input" -> "Send Pointer to Device".

For a quick overview (without hovering), you can preview the project by selecting "Editor" -> "Canvas" while opening the [MusicPlayerView.swift](https://github.com/festusojo123/MusicPlayer/blob/main/MusicPlayer/MusicPlayerView.swift) file.
