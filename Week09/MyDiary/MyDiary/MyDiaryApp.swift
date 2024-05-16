//
//  MyDiaryApp.swift
//  MyDiary
//
//  Created by Mer Owens on 5/8/24.
//

import SwiftUI

@main
struct MyDiaryApp: App {
    @StateObject private var diaryViewModel = DiaryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @State private var isTextEntryPresented = false
    @State private var isImageEntryPresented = false

    var body: some View {
        NavigationView {
            CalendarView()
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
                    TextEntryView(isPresented: $isTextEntryPresented, date: Date())
                }
                .sheet(isPresented: $isImageEntryPresented) {
                    ImageEntryView(isPresented: $isImageEntryPresented, date: Date())
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
