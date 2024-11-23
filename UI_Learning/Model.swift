import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let albumArt: String
}

let sampleSongs = [
    Song(title: "Post Malone,Swae Lee-Sunflower", artist: "Boston Symphony Orchestra...", albumArt: "album1"),
    Song(title: "Ed Sheeran-Perfect", artist: "Vienna Philharmonic & Herbert...", albumArt: "album2"),
    Song(title: "Ed Sheeran-Shape of You", artist: "Berlin Philharmonic & Herbert...", albumArt: "album3")
]
