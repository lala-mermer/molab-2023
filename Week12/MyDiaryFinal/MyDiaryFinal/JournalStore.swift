//
//  JournalStore.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//
// JournalStore.swift

import SwiftUI

class JournalStore: ObservableObject {
    @Published var entries: [JournalEntry] = []

    func addEntry(date: Date, text: String?, image: Image?) {
        if let index = entries.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            entries[index].text = text
            entries[index].image = image
        } else {
            let newEntry = JournalEntry(date: date, text: text, image: image)
            entries.append(newEntry)
        }
    }

    func deleteText(for date: Date) {
        if let index = entries.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            entries[index].text = nil
        }
    }

    func deleteImage(for date: Date) {
        if let index = entries.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            entries[index].image = nil
        }
    }

    func deleteEntry(_ entry: JournalEntry) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries.remove(at: index)
        }
    }

    func entry(for date: Date) -> JournalEntry? {
        return entries.first { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
}
