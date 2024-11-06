import SwiftUI

struct ContentView: View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
