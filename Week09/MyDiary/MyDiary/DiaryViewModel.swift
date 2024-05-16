//
//  DiaryViewModel.swift
//  MyDiary
//
//  Created by Mer Owens on 5/16/24.
//

import Foundation
import SwiftUI

class DiaryViewModel: ObservableObject {
    @Published var entries: [Date: [DiaryEntry]] = [:]

    func addEntry(for date: Date, text: String?, image: UIImage?) {
        let newEntry = DiaryEntry(date: date, text: text, image: image)
        if entries[date] != nil {
            entries[date]?.append(newEntry)
        } else {
            entries[date] = [newEntry]
        }
    }

    func deleteEntry(_ entry: DiaryEntry) {
        entries[entry.date]?.removeAll { $0.id == entry.id }
        if entries[entry.date]?.isEmpty == true {
            entries.removeValue(forKey: entry.date)
        }
    }
}
