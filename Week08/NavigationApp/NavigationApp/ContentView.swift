//
//  ContentView.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var audioRecorder : AudioRecorder
    @EnvironmentObject var audioPlayer : AudioPlayer
    
  var body: some View {
    NavigationView {
        List {
            NavigationLink(destination: AboutMe()) {
                Text("About Mona")
            }
            NavigationLink(destination: MyFriends()) {
                Text("Mona's Friends")
            }
            NavigationLink(destination: Recordings()
                .environmentObject(AudioRecorder()).environmentObject(AudioPlayer())) {
                Text("Mona's Recordings")
            }
//            NavigationLink(destination: PhotoAlbum()) {
//                Text("Mona's Photo Album")
//            }
        }
        .navigationBarTitle("Mona's Profile", displayMode: .inline)
    }
  }
}

//struct PhotoAlbum: View {
//    @State private var mona : [Mona] = [Image("mona1"), Image("mona2"), Image("mona3")]
//    @State private var currentIndex: Int = 0
//    
//    var body: some View{
//        VStack{
//            if let currentMona = mona[currentIndex] {
//                Image(currentMona)
//                    .resizable()
//                    .frame(width: 300, height: 300)
//                    .cornerRadius(30)
//            }
//            
//            HStack{
//                Button(action: {
//                    playPrevious()
//                }) {
//                    Image(systemName: "backward.fill")
//                        .font(.title)
//                }
//
//                Button(action: {
//                    togglePlayPause()
//                }) {
//                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
//                        .font(.title)
//                }
//
//                Button(action: {
//                    playNext()
//                }) {
//                    Image(systemName: "forward.fill")
//                        .font(.title)
//                }
//            }
//            Spacer()
//        }
//        .navigationBarTitle("Slideshow", displayMode: .inline)
//        .onAppear {
//            play()
//        }
//        .onDisappear {
//            stopTimer()
//        }
//    }
//    private func play() {
//        if songs.isEmpty {
//            return
//        }
//
//        if !isPlaying && !isSlideshowPaused {
//            togglePlayPause()
//        }
//    }
//
//    private func playNext() {
//        if currentIndex < songs.count - 1 {
//            currentIndex += 1
//        } else {
//            currentIndex = 0
//        }
//    }
//
//    private func playPrevious() {
//        if currentIndex > 0 {
//            currentIndex -= 1
//        } else {
//            currentIndex = songs.count - 1
//        }
//    }
//}
struct Recordings: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder

    var body: some View {
        NavigationView{
            VStack{
                RecordingsList(audioRecorder: _audioRecorder)
                
                if audioRecorder.recording == false {
                    Button(action: {self.audioRecorder.startRecording()}) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                } else {
                    Button(action: {self.audioRecorder.stopRecording()}) {
                        Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
        .navigationBarTitle("Recordings")
        .navigationBarItems(trailing: EditButton())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioRecorder())
                .environmentObject(AudioPlayer())
    }
}
