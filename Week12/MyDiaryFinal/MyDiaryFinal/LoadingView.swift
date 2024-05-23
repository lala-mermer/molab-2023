//
//  LoadingView.swift
//  MyDiaryFinal
//
//  Created by Mer Owens on 5/22/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            // Background with pastel color gradient
            LinearGradient(gradient: Gradient(colors: [Color.pastelPink, Color.pastelPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Geometrical shapes in the background
            GeometryReader { geometry in
                ForEach(0..<10) { _ in
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .position(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: 0...geometry.size.height))
                }
            }
            
            // Text content with thicker stroke
            VStack {
                Text("My Diary")
                    .font(.custom("Snell Roundhand", size: 55)) // Cursive font
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
//                    .overlay(
//                        // Apply thicker stroke to the text
//                        Text("My Diary")
//                            .font(.custom("Snell Roundhand", size: 50))
//                            .foregroundColor(Color.white.opacity(0.2)) // Stroke color
//                            .padding(.bottom, 20)
//                            .overlay(
//                                Text("My Diary")
//                                    .font(.custom("Snell Roundhand", size: 50))
//                                    .foregroundColor(Color.white) // Text color
//                                    .offset(x: 2, y: 2) // Offset to create stroke effect
//                            )
//                    )
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
    }
}
