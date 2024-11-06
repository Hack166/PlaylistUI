import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let albumArt: String
}

let sampleSongs = [
    Song(title: "The Planets,Op.32:IV.Jup...", artist: "Boston Symphony Orchestra...", albumArt: "album1"),
    Song(title: "Symphony No.7 in E Major...", artist: "Vienna Philharmonic & Herbert...", albumArt: "album2"),
    Song(title: "Symphony No.9 in D Minor...", artist: "Berlin Philharmonic & Herbert...", albumArt: "album3")
]
