//
//  CalendarView.swift
//  MyDiary
//
//  Created by Mer Owens on 5/8/24.
//
import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @Binding var selectedDate: Date

    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            List {
                ForEach(diaryEntries(for: selectedDate)) { entry in
                    EntryView(entry: entry)
                        .contextMenu {
                            Button(action: {
                                diaryViewModel.deleteEntry(entry)
                            }) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                }
            }
        }
    }

    private func diaryEntries(for date: Date) -> [DiaryEntry] {
        diaryViewModel.entries[date] ?? []
    }
}

struct EntryView: View {
    let entry: DiaryEntry

    var body: some View {
        VStack(alignment: .leading) {
            if let text = entry.text {
                Text(text)
            }
            if let image = entry.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
        }
        .padding()
    }
}
