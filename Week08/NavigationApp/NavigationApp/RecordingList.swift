//
//  RecordingList.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//  Copyright © 2024 itpstudent. All rights reserved.
//

import SwiftUI

struct RecordingsList: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder
    
    var body: some View {
        List {
            ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                RecordingRow(audioURL: recording.fileURL)
            }
        .onDelete(perform: delete)
        }
    }
    
    func delete(at offsets: IndexSet) {
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}

struct RecordingRow: View {
    
    var audioURL: URL
    
    @EnvironmentObject var audioPlayer : AudioPlayer
    
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()
            if audioPlayer.isPlaying == false {
                Button(action: {
                    self.audioPlayer.startPlayback(audio: self.audioURL)
                }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }
            } else {
                Button(action: {
                    self.audioPlayer.stopPlayback()
                }) {
                    Image(systemName: "stop.fill")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsList().environmentObject(AudioRecorder())
            .environmentObject(AudioPlayer())
    }
}

