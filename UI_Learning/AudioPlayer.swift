// AudioPlayer.swift
import SwiftUI
import Combine
import AVFoundation

class AudioPlayer: NSObject, ObservableObject {
    var player: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var currentSong: Song?
    var songs: [Song] = [] // 确保有歌曲列表

    var currentIndex: Int? {
        songs.firstIndex(where: { $0.id == currentSong?.id })
    }

    var currentDuration: Double {
        player?.duration ?? 0
    }

    func play(song: Song) {
        if currentSong?.id == song.id && isPlaying {
            pause()
            return
        }
        // 停止播放当前歌曲
        if let player = player, player.isPlaying {
            player.stop()
        }

        guard let url = Bundle.main.url(forResource: song.title, withExtension: "mp3") else {
            print("文件未找到")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.play()
            currentSong = song
            isPlaying = true
        } catch {
            print("播放失败: \(error.localizedDescription)")
        }
    }

    func playCurrent() {
        if let player = player {
            player.play()
            isPlaying = true
        }
    }

    func pause() {
        player?.pause()
        isPlaying = false
    }

    func seek(to time: Double) {
        player?.currentTime = time
    }

    func playNext() {
        guard let index = currentIndex else { return }
        let nextIndex = (index + 1) % songs.count
        play(song: songs[nextIndex])
    }

    func playPrevious() {
        guard let index = currentIndex else { return }
        let previousIndex = (index - 1 + songs.count) % songs.count
        play(song: songs[previousIndex])
    }
}

extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playNext()
    }
}