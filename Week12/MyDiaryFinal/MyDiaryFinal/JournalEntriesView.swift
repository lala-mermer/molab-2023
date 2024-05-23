//
//  JournalEntriesView.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//

import SwiftUI

struct JournalEntriesView: View {
    @ObservedObject var journalStore: JournalStore
    @Binding var selectedDate: Date

    var body: some View {
        VStack(alignment: .leading) {
            if let entry = journalStore.entry(for: selectedDate) {
                Text("Entry for \(formattedDate(selectedDate))")
                    .font(.headline)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if let text = entry.text {
                    Text(text)
                        .padding(.vertical)
                }

                if let image = entry.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .padding(.vertical)
                }

                Button(action: {
                    journalStore.deleteText(for: selectedDate)
                }) {
                    Text("Delete Text")
                        .foregroundColor(.red)
                }
                .padding(.top)

                Button(action: {
                    journalStore.deleteImage(for: selectedDate)
                }) {
                    Text("Delete Image")
                        .foregroundColor(.red)
                }
                .padding(.top)
            } else {
                Text("No entry for \(formattedDate(selectedDate))")
                    .font(.headline)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
