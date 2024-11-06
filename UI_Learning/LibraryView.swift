import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Library")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: {
                        // 能按下
                    }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.black)
                    }
                }
                .padding()
                
                List {
                    NavigationLink(destination: CustomBackButtonView(destination: PlaylistView())) {
                        HStack {
                            Image(systemName: "music.note.list")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.black)
                            Text("Playlists")
                                .font(.headline)
                        }
                    }
                    
                    Button(action: {
                        // Artists 按钮的动作
                    }) {
                        HStack {
                            Image(systemName: "music.microphone")
                                .resizable()
                                .frame(width: 23, height: 23)
                                .foregroundStyle(.black)
                            Text("Artists")
                                .font(.headline)
                        }
                    }
                    
                    Button(action: {
                        // Albums 按钮的动作
                    }) {
                        HStack {
                            Image(systemName: "square.stack")
                                .resizable()
                                .frame(width: 23, height: 23)
                                .foregroundStyle(.black)
                            Text("Albums")
                                .font(.headline)
                        }
                    }
                    
                    
                    
                    NavigationLink(destination: CustomBackButtonView(destination: SongListView(songs: sampleSongs))) {
                        HStack {
                            Image(systemName: "music.note")
                                .resizable()
                                .frame(width: 16, height: 23)
                                .foregroundStyle(.black)
                                .padding(.leading, 7)
                            Text("Songs")
                                .font(.headline)
                        }
                    }
                    
                    Button(action: {
                        // Downloaded 按钮的动作
                    }) {
                        HStack {
                            Image(systemName: "arrow.down.circle")
                                .resizable()
                                .frame(width: 23, height: 23)
                                .foregroundStyle(.black)
                            Text("Downloaded")
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}




//很有用的一个自定义返回按钮
struct CustomBackButtonView<Destination: View>: View {
    let destination: Destination
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        destination
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        
                        
                        
                    Text("Library")
                }
            })
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}





