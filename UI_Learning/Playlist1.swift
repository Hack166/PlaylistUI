import SwiftUI
import Combine

struct Playlist1View: View {
    let songs: [Song]
    @State private var refreshedSongs: [Song] = []
    @State private var isRefreshing = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image("Cover")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(7)
                .padding()
            Text("Classical")
                .bold()
                .font(.headline)
            Text("Yoda")
                .foregroundColor(.red)
                .font(.headline)
                .bold()
            Text("Just Updated")
                .foregroundColor(.gray)
                .font(.subheadline)
            HStack {
                Button(action: {
                    // 按钮点击事件
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(.red)
                        Text("Play")
                            .foregroundColor(.red)
                    }
                    .frame(width: 160, height: 45)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                }
                .padding(.trailing, 10)
                Button(action: {
                    // 按钮点击事件
                }) {
                    HStack {
                        Image(systemName: "shuffle")
                            .foregroundColor(.red)
                        Text("Shuffle")
                            .foregroundColor(.red)
                    }
                    .frame(width: 160, height: 45)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                }
            }
            .padding()
            
            List {
                ForEach(refreshedSongs.isEmpty ? songs : refreshedSongs) { song in
                    HStack {
                        Image(song.albumArt)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(7)
                        VStack(alignment: .leading) {
                            Text(song.title)
                                .font(.headline)
                            Text(song.artist)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            .refreshable {
                refreshSongs()
            }
        }
        .onAppear {
            refreshedSongs = songs
        }
    }
    
    private func refreshSongs() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // 模拟数据刷新
            refreshedSongs.append(Song(title: "New Song", artist: "New Artist", albumArt: "newAlbumArt"))
            isRefreshing = false
        }
    }
}

struct Playlist1View_Previews: PreviewProvider {
    static var previews: some View {
        Playlist1View(songs: sampleSongs)
    }
}
