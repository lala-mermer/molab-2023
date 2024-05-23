//
//  ContentView.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @ObservedObject var journalStore = JournalStore()
    @State private var showingAddEntryView = false
    @State private var isLoading = true

    var body: some View {
        ZStack {
            // Background with pastel color gradient
            LinearGradient(gradient: Gradient(colors: [Color.pastelPink, Color.pastelPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            if isLoading {
                LoadingView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.isLoading = false
                            }
                        }
                    }
            } else {
                NavigationView {
                    VStack {
                        CalendarView(selectedDate: $selectedDate)
                                    .padding(.bottom)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.pastelPink, Color.pastelPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)) // Apply gradient background
                                
                                Divider().padding()
                                
                                ScrollView {
                                    JournalEntriesView(journalStore: journalStore, selectedDate: $selectedDate)
                                }
                                
                                Spacer()
                    }
                    .padding()
                    .navigationBarTitle("My Diary", displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        showingAddEntryView = true
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
                    .sheet(isPresented: $showingAddEntryView) {
                        AddEntryView(selectedDate: $selectedDate, journalStore: journalStore)
                    }
                }
            }
            
            // Decorative bubbles in the background
            GeometryReader { geometry in
                ForEach(0..<20) { _ in
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: CGFloat.random(in: 20...50), height: CGFloat.random(in: 20...50))
                        .position(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: 0...geometry.size.height))
                }
            }
        }
        .onAppear {
            if #available(iOS 15.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    windowScene.windows.first?.rootViewController?.overrideUserInterfaceStyle = .light
                }
            } else {
                UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .light
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
