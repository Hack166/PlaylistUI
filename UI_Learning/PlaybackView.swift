// PlaybackView.swift
import SwiftUI

struct PlaybackView: View {
    @EnvironmentObject var audioPlayer: AudioPlayer
    @State private var currentTime: Double = 0
    @State private var timer: Timer? = nil

    var body: some View {
        VStack(spacing: 20) {
            if let currentSong = audioPlayer.currentSong {
                // 专辑封面
                Image(currentSong.albumArt)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(10)
                    .padding()

                // 歌曲标题
                Text(currentSong.title)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // 艺术家名称
                Text(currentSong.artist)
                    .font(.headline)
                    .foregroundColor(.gray)

                // 进度条
                VStack {
                    Slider(value: Binding(
                        get: {
                            self.currentTime
                        },
                        set: { newValue in
                            self.currentTime = newValue
                            audioPlayer.seek(to: newValue)
                        }
                    ), in: 0...audioPlayer.currentDuration, onEditingChanged: { _ in
                        // 可以在这里添加拖动时的逻辑
                    })
                    .accentColor(.red)

                    HStack {
                        Text(formatTime(time: currentTime))
                        Spacer()
                        Text(formatTime(time: audioPlayer.currentDuration))
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // 播放控制按钮
                HStack(spacing: 50) {
                    // 上一首按钮
                    Button(action: {
                        audioPlayer.playPrevious()
                        resetTimer()
                    }) {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 45, height: 30)
                            .foregroundColor(.black)
                    }

                    // 播放/暂停按钮
                    Button(action: {
                        if audioPlayer.isPlaying {
                            audioPlayer.pause()
                            timer?.invalidate()
                        } else {
                            audioPlayer.playCurrent()
                            startTimer()
                        }
                    }) {
                        Image(systemName: audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.black)
                            
                    }

                    // 下一首按钮
                    Button(action: {
                        audioPlayer.playNext()
                        resetTimer()
                    }) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 45, height: 30)
                            .foregroundColor(.black)
                    }
                }
                .padding()

                Spacer()
            } else {
                Text("没有正在播放的歌曲")
                    .font(.title)
                    .padding()
                Spacer()
            }
        }
        .navigationTitle("正在播放")
        .onAppear {
            if audioPlayer.isPlaying {
                startTimer()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    // 格式化时间显示
    func formatTime(time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // 启动定时器以更新进度条
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let player = audioPlayer.player {
                self.currentTime = player.currentTime
            }
        }
    }

    // 重置定时器
    func resetTimer() {
        timer?.invalidate()
        self.currentTime = 0
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackView().environmentObject(AudioPlayer())
    }
}
