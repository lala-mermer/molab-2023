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
                .environmentObject(diaryViewModel)
        }
    }
}
