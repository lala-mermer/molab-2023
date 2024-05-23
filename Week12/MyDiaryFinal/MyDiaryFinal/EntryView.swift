//
//  EntryView.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//

// EntryView.swift

import SwiftUI

struct EntryView: View {
    @Binding var selectedDate: Date
    @ObservedObject var journalStore: JournalStore
    @State private var text: String = ""
    @State private var image: Image? = nil
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage? = nil

    var body: some View {
        VStack(alignment: .leading) {
            Text("Journal Entry for \(formattedDate(selectedDate))")
                .font(.headline)
                .padding(.top)

            TextEditor(text: $text)
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .padding(.vertical)

            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.vertical)
            }

            HStack {
                Button(action: saveEntry) {
                    Text("Save Entry")
                }
                .padding()

                Button(action: clearEntry) {
                    Text("Clear Entry")
                }
                .padding()

                Spacer()

                Button(action: {
                    self.showingImagePicker = true
                }) {
                    Text("Add Image")
                }
                .padding()
            }
        }
        .padding()
        .onAppear(perform: loadEntry)
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }

    private func saveEntry() {
        journalStore.addEntry(date: selectedDate, text: text.isEmpty ? nil : text, image: image)
    }

    private func loadEntry() {
        if let entry = journalStore.entry(for: selectedDate) {
            text = entry.text ?? ""
            image = entry.image
        } else {
            text = ""
            image = nil
        }
    }

    private func clearEntry() {
        text = ""
        image = nil
    }

    private func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
