import SwiftUI
import Combine
import AVFoundation

struct Playlist1View: View {
    let songs: [Song]
    
    @StateObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        NavigationView {
        VStack(spacing: 0){
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
                        if let firstSong = songs.first {
                            audioPlayer.play(song: firstSong)
                        }
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
                        if let randomsong = songs.randomElement() {
                            audioPlayer.play(song: randomsong)
                        }
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
                    ForEach(songs) { song in
                        HStack {
                            // 左侧点击区域
                            Button(action: {
                                // 左侧点击事件
                                audioPlayer.play(song: song)
                            }) {
                                HStack {
                                    Image(song.albumArt)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(7)
                                    VStack(alignment: .leading) {
                                        Text(song.title)
                                            .font(.headline)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        Text(song.artist)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                    }
                                    Spacer()
                                    //状态显示
                                    /*Image(systemName: audioPlayer.currentSong?.id == song.id && audioPlayer.isPlaying ? "speaker.3.fill" : "play.fill")
                                        .foregroundColor(audioPlayer.currentSong?.id == song.id && audioPlayer.isPlaying ? .red : .red)*/
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(minHeight: 44) // 确保最小触摸高度为44
                            // 右侧点击区域
                            Button(action: {
                                // 右侧点击事件
                                
                            }) {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.black)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(minHeight: 44) // 确保最小触摸高度为44
                            .contentShape(Rectangle())
                            
                        }
                        .contentShape(Rectangle())
                    }
                }
                Divider()
                if let currentSong = audioPlayer.currentSong {
                    HStack {
                        NavigationLink(destination: PlaybackView().environmentObject(audioPlayer)) {
                            Image(currentSong.albumArt)
                                .resizable()
                                .frame(width: 45, height: 45)
                                .cornerRadius(4)
}
                        NavigationLink(destination: PlaybackView().environmentObject(audioPlayer)) {
                            Text(currentSong.title)
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.black)
                            .lineLimit(1)
                            .truncationMode(.tail)
}
                        /*Text(currentSong.title)
                            .font(.headline)
                            .bold()
                            .lineLimit(1)
                            .truncationMode(.tail)*/
                        Spacer()
                        
                        Button(action: {
                            // 按钮点击事件
                            if audioPlayer.isPlaying {
                                audioPlayer.pause()
                            }else {
                                if let song = audioPlayer.currentSong {
                                    audioPlayer.play(song: song)
                                }
                            }
                            }) {
                            Image(systemName: audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                        Button(action: {
                            // 按钮点击事件: 下一首
                            if let currentIndex = songs.firstIndex(where: { $0.id == currentSong.id }) {
                                if currentIndex + 1 < songs.count {
                                    audioPlayer.play(song: songs[currentIndex + 1])
                                }else {
                                    audioPlayer.play(song: songs.first!)
                                }}}) {
                            Image(systemName: "forward.fill")
                                .resizable()
                                .frame(width: 25, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    /*.background(Color(.systemBackground))
                    .cornerRadius(10)*/
                    .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1) // 添加边框
                                .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: -2) // 添加阴影
                        )
                    
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                }else{
                    Spacer()
                }
            }
            .environmentObject(audioPlayer)
                
        }}
    }
}


struct Playlist1View_Previews: PreviewProvider {
    static var previews: some View {
        Playlist1View(songs: sampleSongs)
    }
}
