//
//  CalendarView.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//

// CalendarView.swift
import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date

    var body: some View {
        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
    }
}
