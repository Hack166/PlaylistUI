import SwiftUI

struct SongListView: View {
    let songs: [Song]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Songs")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            List {
                ForEach(songs) { song in
                    HStack {
                        NavigationLink(destination: SongDetailView(song: song)) {
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
                        Spacer()
                        Button(action: {
                            //跳转到SongDetailView
                            
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding(0)
        }
    }
}

struct SongDetailView: View {
    let song: Song
    
    var body: some View {
        VStack {
            Image(song.albumArt)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(16)
                .padding()
            Text(song.title)
                .font(.largeTitle)
                .bold()
            Text(song.artist)
                .font(.title)
                .foregroundColor(.gray)
            Spacer()
        }
        .navigationTitle(song.title)
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(songs: sampleSongs)
    }
}
