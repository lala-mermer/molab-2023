//
//  Recordings.swift
//  NavigationApp
//
//  Created by Mer Owens on 01/24/24.
//



import SwiftUI

struct Recordings: View {
    
    @EnvironmentObject var audioRecorder: AudioRecorder

    var body: some View {
        NavigationView{
            VStack{
                RecordingsList(audioRecorder: audioRecorder)
                
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


struct Recordings_Previews: PreviewProvider {
    static var previews: some View {
        Recordings()
            .environmentObject(AudioRecorder())
    }
}
