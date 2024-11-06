import SwiftUI

struct PlaylistView: View {
    var body: some View {
        VStack {
            
            Text("Playlists")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            List{
                NavigationLink(destination: Playlist1View(songs: sampleSongs)) {
                    HStack {
                        Image("Cover")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .foregroundStyle(.black)
                            .cornerRadius(5)
                        Text("Classical")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
