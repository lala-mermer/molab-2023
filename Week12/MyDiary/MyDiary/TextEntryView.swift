//
//  TextEntryView.swift
//  MyDiary
//
//  Created by Mer Owens on 5/8/24.
//
import SwiftUI

struct TextEntryView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @Binding var isPresented: Bool
    var date: Date

    @State private var text: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $text)
                    .padding()
                    .background(Color.pastelPurple.opacity(0.2))
                    .cornerRadius(10)
                    .padding()

                Button(action: {
                    diaryViewModel.addEntry(for: date, text: text, image: nil)
                    isPresented = false
                }) {
                    Text("Save")
                        .padding()
                        .background(Color.pastelGreen)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding()
            }
            .background(Color.pastelPink.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("New Entry", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                isPresented = false
            }) {
                Text("Cancel")
                    .foregroundColor(.pastelBlue)
            })
        }
    }
}
