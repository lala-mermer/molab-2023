//
//  ContentView.swift
//  Week04-multi-screen
//
//  Created by Mer Owens on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 30
    
    // Flag for timer state.
    @State var timerIsRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let timerTypes = ["Plank", "Crunch"]
    @State private var timerType = "Plank"
    @State private var showingAlert = false

    
    var timeVal:Int {
        if(timerType == "Plank"){
            return 30
        } else {
            return 60
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select Exercise")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                Picker("Timer", selection: $timerType){
                    ForEach(timerTypes, id: \.self){
                        Text($0)
                    }
                }
                .frame(width: 300)
                .pickerStyle(.segmented)
                .padding()
                .onChange(of: timerType) {
                    timeRemaining = timeVal
                }
                Text("\(timeRemaining)")
                    .font(.system(size: 200, weight: .medium, design: .rounded))
                    .padding()
                    .frame(width: 300)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Button(action: {
                    // Toggle timer on/off.
                    self.timerIsRunning.toggle()
                    
                    // If timer is not running, reset back to 60
                    if !self.timerIsRunning {
                        self.timeRemaining = timeVal
                    }
                }) {
                    // Start / Restart Button
                    Text(timerIsRunning ? "Restart" : "Start")
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: 300, height: 60)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .padding()
                }
            }
            
            .onReceive(timer) { _ in
                
                // If timeRemaining and timer is running, count down.
                if self.timeRemaining == 0{
                    showingAlert = true
                }
                else if self.timeRemaining > 0 && self.timerIsRunning {
                    self.timeRemaining -= 1
                    
                    print("Time Remaining:", self.timeRemaining)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .alert("This set is done!", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    timeRemaining = timeVal
                    self.timerIsRunning.toggle()
                }
            }
            .navigationTitle("Workout Timer")
        }
    }
}

#Preview {
    ContentView()
}
