//
//  ContentView.swift
//  week 4
//
//  Created by Mer Owens on 10/5/23.
//

import SwiftUI
import AVFoundation

struct Song: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let fileName: String
    let imageName: String
}

let songs: [Song] = [
    Song(title: "Fred Again.. - Jungle", fileName: "jungle", imageName: "fred"),
    Song(title: "Kenya Grace - Strangers", fileName: "strangers", imageName: "kenya")
    // Add more songs as needed
]

struct ContentView: View {
    @StateObject var audioPlayerManager = AudioPlayerManager()
    
    var body: some View {
        VStack {
            ForEach(songs) { song in
                NavigationView {
                    PlayerView(song: song)
                        .padding(.bottom, 6.0)
                        .environmentObject(audioPlayerManager)
                }
                .padding()
                Text(song.title)
                    .font(.headline)
            }
            .padding(.bottom, 38.0)
            .background(Color.yellow)
        }
    }
}

struct PlayerView: View {
    let song: Song
    @EnvironmentObject var audioPlayerManager: AudioPlayerManager
    @State private var isPlaying = false
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            Text("\n")
            Text(song.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(-110.0)
            Image(song.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
            
            Button(action: {
                if isPlaying {
                    audioPlayerManager.stopAudio()
                    stopTimer()
                } else {
                    audioPlayerManager.playAudio(fileName: song.fileName)
                    startTimer()
                }
                isPlaying.toggle()
            }) {
                Text(isPlaying ? "⏸" : "▶️")
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
                    .padding(.bottom, -13.0)
            }
            Spacer()
            
            Text(timeFormatted(elapsedTime))
                .fontWeight(.semibold)
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
        }
        .onChange(of: audioPlayerManager.selectedSong) { _ in
            if audioPlayerManager.selectedSong != song {
                isPlaying = false
                elapsedTime = 0 // Reset the timer
            }
        }
        .background(Color.yellow)

    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let player = audioPlayerManager.audioPlayer {
                elapsedTime = player.currentTime
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func timeFormatted(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }

    
}

class AudioPlayerManager: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer?
    @Published var selectedSong: Song?
    
    func playAudio(fileName: String) {
        if let player = loadBundleAudio(fileName) {
            audioPlayer = player
            audioPlayer?.play()
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
        selectedSong = nil
    }
    
    func loadBundleAudio(_ fileName: String) -> AVAudioPlayer? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                return try AVAudioPlayer(contentsOf: url)
            } catch {
                print("loadBundleAudio error", error)
            }
        }
        return nil
    }
}
