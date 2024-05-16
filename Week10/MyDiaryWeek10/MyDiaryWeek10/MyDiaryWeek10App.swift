//
//  MyDiaryWeek10App.swift
//  MyDiaryWeek10
//
//  Created by Mer Owens on 5/16/24.
//

import SwiftUI

@main
struct MyDiaryWeek10App: App {
    @StateObject private var diaryViewModel = DiaryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(diaryViewModel)
        }
    }
}
