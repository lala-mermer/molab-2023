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

                Button(action: {
                    diaryViewModel.addEntry(for: date, text: text, image: nil)
                    isPresented = false
                }) {
                    Text("Save")
                }
                .padding()
            }
            .navigationBarTitle("New Entry", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                isPresented = false
            }) {
                Text("Cancel")
            })
        }
    }
}
