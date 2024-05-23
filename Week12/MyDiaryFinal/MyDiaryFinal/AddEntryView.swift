//
//  AddEntryView.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//
import SwiftUI

struct AddEntryView: View {
    @Binding var selectedDate: Date
    @ObservedObject var journalStore: JournalStore
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    @State private var image: Image? = nil
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage? = nil

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Journal Entry for \(formattedDate(selectedDate))")
                    .font(.headline)
                    .padding(.top)

                TextEditor(text: $text)
                    .frame(height: 200)
                    .border(Color.gray, width: 1)
                    .padding(.vertical)

                HStack {
                    Button(action: saveEntry) {
                        Text("Save Entry")
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

                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.vertical)

                    Button(action: clearImage) {
                        Text("Delete Image")
                            .foregroundColor(.red)
                    }
                    .padding(.top)
                }

                Button(action: clearText) {
                    Text("Delete Text")
                        .foregroundColor(.red)
                }
                .padding(.top)
            }
            .padding()
            .onAppear(perform: loadEntry)
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .navigationBarTitle("Add/Edit Entry", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }

    private func saveEntry() {
        journalStore.addEntry(date: selectedDate, text: text.isEmpty ? nil : text, image: image)
        presentationMode.wrappedValue.dismiss()
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

    private func clearText() {
        text = ""
        journalStore.deleteText(for: selectedDate)
    }

    private func clearImage() {
        image = nil
        journalStore.deleteImage(for: selectedDate)
    }

    private func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}
