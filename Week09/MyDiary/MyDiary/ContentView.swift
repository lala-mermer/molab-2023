//
//  ContentView.swift
//  MyDiary
//
//  Created by Mer Owens on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @State private var isTextEntryPresented = false
    @State private var isImageEntryPresented = false
    @State private var selectedDate: Date = Date()

    var body: some View {
        NavigationView {
            CalendarView(selectedDate: $selectedDate)
                .navigationTitle("MyDiary")
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        isTextEntryPresented = true
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                    .padding()

                    Button(action: {
                        isImageEntryPresented = true
                    }) {
                        Image(systemName: "camera")
                    }
                    .padding()
                })
                .sheet(isPresented: $isTextEntryPresented) {
                    TextEntryView(isPresented: $isTextEntryPresented, date: selectedDate)
                        .environmentObject(diaryViewModel)
                }
                .sheet(isPresented: $isImageEntryPresented) {
                    ImageEntryView(isPresented: $isImageEntryPresented, date: selectedDate)
                        .environmentObject(diaryViewModel)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DiaryViewModel())
    }
}
