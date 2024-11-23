import SwiftUI


struct ContentView: View {
    @StateObject var audioPlayer = AudioPlayer()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            NewView()
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("New")
                }
            LibraryView()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Library")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
        }
        .environmentObject(audioPlayer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
